terraform {
  cloud {
    organization = "javacodestream-org"

    workspaces {
      name = "tf-cloud-cli"
    }
  }
}