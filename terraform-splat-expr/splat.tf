provider "aws" {
  region     = "ap-south-1"
}
resource "aws_iam_user" "my_iam_user" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "arns_all" {
  value = aws_iam_user.my_iam_user[*].arn
}

output "arns_0_index" {
  value = aws_iam_user.my_iam_user[0].arn
}