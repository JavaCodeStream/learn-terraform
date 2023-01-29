resource "local_file" "my_local_file" {
  filename = "${path.module}/my_local_file"
  content  = "We love Pets!"
}

resource "random_pet" "my_pet" {
  prefix    = "Mrs"
  separator = "."
  length    = 1
}
