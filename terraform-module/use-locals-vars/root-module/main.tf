module "my_module_local_file" {
  source          = "../child-module"

  # These are exposed input values from module
  # root module can not assign values to actual resource's attributes directly.
  local_file_name = "${path.module}/my_local_file_test.txt"
  local_file_content = "Happy New Year 2023!!!"

}

