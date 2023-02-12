provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = "t2.micro"
}

resource "aws_eip" "my_eip" {
  instance = aws_instance.my_ec2.id
  vpc      = true
}

resource "aws_security_group" "my_sg" {
  name = "my_sg"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.my_eip.private_ip}/32"]

  }
}