# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

resource "local_file" "module_local_file" {
  # module users can override with the variables 
  filename        = var.local_file_name
  content         = var.local_file_content
  file_permission = local.file_permission_fixed
}

# use of locals prevent alowing module users to override attribute values as only variables gets exposed
# to module users
locals {
  file_permission_fixed = "0777"
}

