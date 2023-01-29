provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = lookup(var.ec2_instance_type, terraform.workspace)
}

variable "ec2_instance_type" {
  type = map(any)

  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    test    = "t2.medium"
    prod    = "t2.large"
  }
}