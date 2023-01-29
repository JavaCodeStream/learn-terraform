# can access only the outputs exposed by module
# refer the exposed outputs like: module.<local_child_module_name>.<output_name_from_child_module_output> 
output "my_module_local_filename" {
  value = module.my_module_local_file.module_local_file_name
}

output "my_module_local_file_permission" {
  value = module.my_module_local_file.module_local_file_permission
}

output "my_module_local_file_content" {
  value = module.my_module_local_file.module_local_file_content
}