locals {
  list1 = ["host1a", "host1b", "host1c"]
}


locals {
  list2 = ["host2a", "host2b", "host2c"]
}


output "print_list1" {
  value = local.list1
}

output "print_list2" {
  value = local.list2
}