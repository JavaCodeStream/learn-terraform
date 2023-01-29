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
  # egress block is removed intentionally, to ensure the 
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = "t2.micro"
  key_name      = "terraform-key-pair" # associate the key-pair to ec2, created separated on aws console

  vpc_security_group_ids = [aws_security_group.allow_ssh.id] # expression dependency for security group

  provisioner "remote-exec" {
    #on_failure = continue    # first comment and run terraform apply to see failure.
    inline = [
      "echo +++++ Creation-Time remote-exec provisioner FAILURE TEST running!!! ++++++",
      "sudo yum -y install nano" # install nano after EC2 is created.
    ]
  }

  connection {
    type        = "ssh"                            # protocol for terraform to connect to EC2
    user        = "ec2-user"                       # user for EC2
    private_key = file("./terraform-key-pair.pem") # downloaded PEM file for the key-pair console.
    host        = self.public_ip                   # public IP of EC2 instance once its available.
  }
}