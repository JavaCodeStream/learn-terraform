provider "aws" {
  region     = "ap-south-1"
}

resource "aws_instance" "my_ec2" { # change name my_webapp -> my_ec2
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region
  instance_type = "t2.micro"
}

resource "aws_iam_user" "my_iam_user" {
  name = "loadbalancer"
  path = "/system/"
}

terraform {
  backend "s3" {
    bucket = "pausan-terraform-state"
    key    = "tf_state_mgmt_move.tfstate"
    region = "ap-south-1"
  }
}