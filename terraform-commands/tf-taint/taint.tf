provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = "t2.micro"
}