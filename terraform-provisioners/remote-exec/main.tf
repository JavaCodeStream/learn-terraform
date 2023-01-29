provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myec2" {
  ami           = "ami-01a4f99c4ac11b03c" # get it from console as per your aws region
  instance_type = "t2.micro"
  key_name      = "terraform-key-pair" # associate the key-pair to ec2, created separated on aws console

  connection {
    type        = "ssh"                            # protocol for terraform to connect to EC2
    user        = "ec2-user"                       # user for EC2
    private_key = file("./terraform-key-pair.pem") # downloaded PEM file for the key-pair console.
    host        = self.public_ip                   # public IP of EC2 instance once its available.
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx"
    ]
  }
}