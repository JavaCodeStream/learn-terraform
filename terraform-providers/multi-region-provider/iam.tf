resource "aws_iam_user" "myiamuser" {
  provider = "aws.mumbai"
  name = "my_iam_user"
  path = "/system/"
}

output "myiamuser_arn" {
  value = aws_iam_user.myiamuser.arn
}