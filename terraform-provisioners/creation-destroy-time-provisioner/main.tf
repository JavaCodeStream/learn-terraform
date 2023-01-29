provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = "t2.micro"
  key_name      = "terraform-key-pair" # associate the key-pair to ec2, created separated on aws console

  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # expression dependency for security group

  provisioner "remote-exec" {
    # by default creation-time provisioner
    inline = [
      "echo +++++ Creation-Time remote-exec provisioner running!!! ++++++",
      "sudo yum -y install nano"    # install nano after EC2 is created.
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "echo +++++ Destroy-Time remote-exec provisioner running!!! +++++ ",
      "sudo yum -y remove nano"    # un-install nano before EC2 is destroyed.
    ]
  }

  connection {
    type        = "ssh"    # protocol for terraform to connect to EC2
    user        = "ec2-user"    # user for EC2
    private_key = file("./terraform-key-pair.pem")   # downloaded PEM file for the key-pair console.
    host        = self.public_ip # public IP of EC2 instance once its available.
  }
}