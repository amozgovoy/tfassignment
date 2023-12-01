data "http" "myip" {
  url = "http://ifconfig.me"
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.cidr_blocks, count.index)
  availability_zone = element(var.availability_zones, count.index)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "route_table_association" {
  count          = length(var.cidr_blocks)
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.main.id
}

resource "aws_security_group" "shared" {
  name        = "shared_sg"
  description = "SG to use to refer to the instance(s) instead of IP"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group" "allow_tcp" {
  name        = "allow_tcp"
  description = "Allow TCP in"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.shared.id]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.shared.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.shared.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_key_pair" "devops" {
  key_name   = "devops-key"
  public_key = var.public_key
}

resource "aws_instance" "server" {
  count                       = length(var.availability_zones)
  ami                         = var.aws_ami
  instance_type               = var.ec2_instance_type
  subnet_id                   = element(aws_subnet.subnet.*.id, count.index) //aws_subnet.subnet_1.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.devops.key_name
  security_groups             = [aws_security_group.allow_tcp.id, aws_security_group.shared.id]
  tags = {
    Name = "Server${count.index + 1}"
  }
}
