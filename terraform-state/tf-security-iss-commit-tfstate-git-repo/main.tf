provider "aws" {
  region     = "ap-south-1"
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance
resource "aws_db_instance" "default" {
  allocated_storage    = 5                  # db storage in GB, free tier upto 20GB
  storage_type         = "gp2"              # general purpose SSD incl in free tier
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "mydb"
  username             = "foo"
  password             = "${file("rds_pass.txt")}"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = "true"
}


