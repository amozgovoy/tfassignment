# AWS Region
variable "region" {
  default = "us-east-1"
}

variable "vpc_id" {
  description = "Existing VPC to use (specify this, if you don't want to create new VPC)"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_key" {
  description = "A public key to add to the EC2 instances"
  type = string
  default = "ssh-rsa AAAAB3NzaC1y...Qtpi5RnQ== nobody@nowhere.com"
}

variable "aws_ami" {
  description = "AWS AMI"
  type = string
  default = "ami-05a66f32ae901754c" # Community Centos 9
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}