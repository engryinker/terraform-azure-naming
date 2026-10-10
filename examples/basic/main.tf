terraform {
  required_version = ">= 1.7.0"
}

module "naming" {
  source = "../.."

  prefix = ["contoso"]
  suffix = ["app1", "prod", "eus"]
}

output "storage_account_name" {
  value = module.naming.names.storage_account.name_unique
}

output "virtual_network_name" {
  value = module.naming.names.virtual_network.name
}
