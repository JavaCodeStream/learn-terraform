data "terraform_remote_state" "eip" {
  backend = "s3"
  config = {
    bucket = "pausan-terraform-state"
    key    = "tf-remote-state-data-src/eip_terraform.tfstate"
    region = "ap-south-1"
  }
}

resource "aws_security_group" "my_sg_allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${data.terraform_remote_state.eip.outputs.my_eip_public_ip}/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

output "my_sg_allow_tls_ingress" {
    value = aws_security_group.my_sg_allow_tls.ingress
}