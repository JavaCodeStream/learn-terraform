output "my_local_filename" {
    description = "FileName of created file on local file system"
    value = local_file.my_local_file.filename
}