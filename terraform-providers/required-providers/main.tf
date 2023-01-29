terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.25.2"
    }
  }
}

provider "digitalocean" {}

resource "random_pet" "my-pet" {
  prefix    = "Mrs"
  separator = "."
  length    = 1
}
