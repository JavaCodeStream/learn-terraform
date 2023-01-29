output "my_ec2_instance_public_ip" {
    value = module.my_ec2_instance.public_ip  # reference to the module registry's exposed output
}

output "my_ec2_instance_id" {
    value = module.my_ec2_instance.id   # reference to the module registry's exposed output
}