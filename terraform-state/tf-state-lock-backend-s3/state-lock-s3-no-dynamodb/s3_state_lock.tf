terraform {
  backend "s3" {
    bucket = "pausan-terraform-state"
    key    = "network/demo.tfstate"
    region = "ap-south-1"
  }
}

resource "time_sleep" "wait_150_seconds" {
  create_duration = "150s"
}