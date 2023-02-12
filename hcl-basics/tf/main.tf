resource "local_file" "my_local_file" {
  filename = "${path.module}/my_local_file.txt"
  content = "We love Pets!!"
}