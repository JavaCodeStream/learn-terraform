provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "web" {
  ami = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1

  instance_type = "t2.micro"   # get it from console from the running instance

  vpc_security_group_ids = ["sg-0e88df4d95d4112db"] # get it from console from the running instance

  key_name = "terraform-key-pair" # get it from console from the running instance

  tags = {
    Name = "terraform-ec2"      # get it from console from the running instance
  }
}