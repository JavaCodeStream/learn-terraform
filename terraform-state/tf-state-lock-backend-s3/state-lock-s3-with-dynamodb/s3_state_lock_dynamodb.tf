terraform {
  backend "s3" {
    bucket = "pausan-terraform-state"
    key    = "network/lock-dynamodb.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-locking"
  }
}

resource "time_sleep" "wait_150_seconds" {
  create_duration = "150s"
}