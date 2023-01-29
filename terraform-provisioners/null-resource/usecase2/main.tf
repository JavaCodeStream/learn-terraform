provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2_cluster" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type = "t2.micro"
  count         = 3
  tags = {
    "cluster-name" = "my_ec2_cluster"
    "ec2-name"     = "my_ec2_${count.index}"
  }
}

resource "null_resource" "ip_check" {

  triggers = {
    latest_ips = join(",", aws_instance.my_ec2_cluster[*].public_ip)
  }
  provisioner "local-exec" {
    command = "echo Latest IPs are - ${null_resource.ip_check.triggers.latest_ips} > cluster_ips.txt"
  }
}