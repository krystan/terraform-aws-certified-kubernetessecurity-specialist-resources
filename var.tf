variable "region" {
  type        = string
  description = "resource location"
  default     = "eu-west-1"
}

variable "allowed_ip" {
  type        = string
  description = "ip address allowed to access"
}

variable "ubuntu_ami_id" {
  type        = string
  description = "ami id for ubuntu"
}


variable "centos_8_ami_id" {
  type        = string
  description = "ami id for centos 8"
}

variable "instance_size_type" {
  type        = string
  description = "size of ec2 instances"
}

variable "ec2_key_name" {
  type        = string
  description = "Name of pre-existing ec2-key for access to instance"
}

variable "admin_ip" {
  type        = string
  description = "ip of admin location"
}
