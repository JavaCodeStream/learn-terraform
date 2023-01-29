resource "local_file" "my-local-file" {
  filename = "${path.module}/my_local_file.txt"
  content  = "We love Pets!!"
}

resource "random_pet" "my-pet" {
  prefix    = "Mrs"
  separator = "."
  length    = "1"
}
