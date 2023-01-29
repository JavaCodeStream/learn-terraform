provider "aws" {
  region     = "ap-south-1"
}

resource "aws_eip" "my_eip" {
  vpc      = true
  depends_on = [null_resource.health_check]
}

resource "null_resource" "health_check" {

 provisioner "local-exec" {
    command = "curl --connect-timeout 2 https://google123.com"
  }
}