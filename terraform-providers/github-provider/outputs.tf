output "github_repo_id" {
    description = "GitHub ID for the repository"
    value = github_repository.terraform_repo.repo_id
}

output "github_ssh_clone_url" {
    description = "URL that can be provided to git clone to clone the repository via SSH."
    value = github_repository.terraform_repo.ssh_clone_url
}
