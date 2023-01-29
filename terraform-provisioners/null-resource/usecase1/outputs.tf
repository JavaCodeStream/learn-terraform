output "my_ec2_cluster_public_ips" {
    value = aws_eip.my_eip.public_ip
}