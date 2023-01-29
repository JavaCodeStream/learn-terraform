module "my_ec2_instance" {  # local module name my_ec2_instance
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name                   = "my_ec2_instance"         # override the default (empty)
  ami                    = "ami-01a4f99c4ac11b03c"  # get it from console as per your aws region ap-south-1
  instance_type          = "t2.micro"               # override the default (t3.micro)
}