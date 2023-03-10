terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.16.0"
    }
  }
}

provider "github" {
    # generate token from Github.com -> login -> settings -> developer settings -> Personal access tokens
    token = "<generate_token_and_use_here>"
}

# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository
resource "github_repository" "terraform_repo" {
  name        = "example_tf_repo"
  description = "For Terraform run test"

  visibility = "private"
}

