# AWS Region
variable "region" {
  default = "us-east-1"
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "availability_zones" {
  description = "AZ codes to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]

}

variable "public_key" {
  description = "A public key to add to the EC2 instances"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCadOVuCQu7y4Y8PedvYa0ZX2vZLTQdLwlZzkzq4vr5L8aEMMmP3MxkVyMBxJqEEVphIpbNmIXV7MbYRpvZAOPs8kWadCRJCHJgvOv0DW82vHyV8x+rTD52nGsUfW9iIxnl7jn/rg+bz1cUknotztb+riAUEa0fC8uqtaD2qr6NkM2+FBnC0QLWt4NIpPE8k6lOSAj6ARJwWKJn3ribAM00cvP6rVBMPRnC42l1vsdpyYpv3bkeKn46AG9nf2+qOKXEyUsDl27ogFP4w2eIZhfLHwWBXGIFnam5jw2VIMHvn2fTU6Xh5a/tr/Hl8YlS+XCsGsjEMd4T+WD9Wx5HGnFdmW1mE2J/HwHhHs8oQmLZJP5vB3hV7MqsTaRNg353PfoMISgk+yIh8eFhq7AeYD6haSXqZgD7osJei5RzuyAQkOZFJaSJ/c2vyQuW7NxKOWeowI+AU+b/zdof/5z9ukCzHrmN+tnUIS+sS3fV0e4zCc/JulcCEHVxIrzET7Dta6rCkJKsmuiuwV0wgintFpNwvpaVE/Cyl5O7K7stm5Ih5Dg8yo+TFQzypVnKoKFLX6fWKP/C0xDS6t6pkiee2UGZqbX37q9bhJ35F2fyo78gmMNWfOUYdBukniuZUHqyR3lQ+VmYPjrVF9dxoUalwgoJaB9mwcy0VdTGzhQtpi5RnQ== amozgovoy@me.com"
}

variable "aws_ami" {
  description = "AWS AMI"
  type        = string
  default     = "ami-05a66f32ae901754c" # Community Centos 9
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.small"
}

