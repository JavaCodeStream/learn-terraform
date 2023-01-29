output "my_ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "my_ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}

output "my_ec2_security_grp_name" {
  value = aws_instance.my_ec2.security_groups
}