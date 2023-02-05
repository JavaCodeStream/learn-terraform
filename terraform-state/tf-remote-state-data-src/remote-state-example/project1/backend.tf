terraform {
  backend "s3" {
    bucket = "pausan-terraform-state"
    key    = "tf-remote-state-data-src/eip_terraform.tfstate"
    region = "ap-south-1"
  }
}

