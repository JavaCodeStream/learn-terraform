provider "aws" {
  region     =  "us-west-1"
}

provider "aws" {
  alias      =  "mumbai"
  region     =  "ap-south-1"
#   profile    =  "account02"
}