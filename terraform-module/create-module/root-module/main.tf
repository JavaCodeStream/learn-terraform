# Using newly created module
module "ec2_sg_module" {
  source = "../child-module"
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region ap-south-1
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.ec2_sg_module.ec2_security_grp_id] # referencing child module's exposed output
}