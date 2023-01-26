resource "local_file" "my-local-file" {
  filename = "${path.module}/${var.filename}"
  content  = var.content
}

resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
}
