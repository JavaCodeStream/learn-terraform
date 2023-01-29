output "my_local_file_content" {
    description = "local file content"
    value = local_file.my_local_file.content
}

output "random_pet_id" {
    description = "ID of random pet"
    value = random_pet.my_pet.id
}