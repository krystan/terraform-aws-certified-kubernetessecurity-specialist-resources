module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "kubernetes-vpc"
  cidr = "10.0.0.0/16"

  azs            = ["eu-west-1a"]
  public_subnets = ["10.0.101.0/24"]

  single_nat_gateway = true
  enable_nat_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true
  manage_default_vpc   = false

  public_subnet_tags = {
    Name = "kubernetes-public"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "kubernetes-security-vpc"
  }
}

data "aws_subnet_ids" "public_subnet_ids" {
  vpc_id = module.vpc.vpc_id
}
 

module "ec2_instance_centos" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "centos-instance"

  ami                    = var.centos_8_ami_id
  instance_type          = var.instance_size_type
  key_name               = var.ec2_key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = tolist(data.aws_subnet_ids.public_subnet_ids.ids)[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "ec2_instance_ubuntu" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "ubuntu-instance"

  ami                    = var.ubuntu_ami_id
  instance_type          = var.instance_size_type
  key_name               = var.ec2_key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = tolist(data.aws_subnet_ids.public_subnet_ids.ids)[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

## Security groups

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [module.vpc.vpc_cidr_block]
  }

  ingress {
    description = "SSH from Admin IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.admin_ip}/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
