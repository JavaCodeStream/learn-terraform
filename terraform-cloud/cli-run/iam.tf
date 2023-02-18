provider "aws" {
  region     = "ap-south-1"
}

resource "aws_iam_user" "myiamuser" {
  name = "loadbalancer"
  path = "/system/"
}

output "myiamuser_arn" {
  value = aws_iam_user.myiamuser.arn
}