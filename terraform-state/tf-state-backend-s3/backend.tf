terraform {
  backend "s3" {
    bucket = "pausan-terraform-state"      # s3 bucket name
    key    = "network/terraform.tfstate"    # path i.e. s3 key where the tfstate file will be stored
    region = "ap-south-1"                   # s3 bucket region, since buckets can be created in any region
  }
}