output "my_ec2_cluster_ips" {
    value = aws_instance.my_ec2_cluster[*].public_ip
}