resource "random_pet" "my_pet" {
  prefix    = "Mrs"
  separator = "."
  length    = "1"
}

output "my_pet_name" {
  value = random_pet.my_pet.id
}