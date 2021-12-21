output "vpc_id" {
  value = module.vpc.vpc_id
}

output "centos_ec2_arn" {
  value = module.ec2_instance_centos.arn
}

output "ubuntu_ec2_arn" {
  value = module.ec2_instance_ubuntu.arn
}

output "security_group_arn" {
  value = aws_security_group.allow_ssh.arn
}
