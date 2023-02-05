data "terraform_remote_state" "local_random_pet_ref" {
  backend = "local"
  config = {
    path = "${path.module}/../project1/terraform.tfstate"
  }
}

resource "local_file" "my_local_file" {
  filename = "${path.module}/my_local_file.txt"
  content  = data.terraform_remote_state.local_random_pet_ref.outputs.my_pet_name
}

output "my_local_file_content" {
  value = local_file.my_local_file.content
}