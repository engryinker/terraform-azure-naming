output "names" {
  description = "Curated map of generated names for the resource types used by the org's compute/network/storage modules. Each value is itself an object with `.name` and `.name_unique` (where the resource type supports a uniqueness suffix)."
  value = {
    resource_group            = module.naming.resource_group
    virtual_network           = module.naming.virtual_network
    subnet                    = module.naming.subnet
    network_security_group    = module.naming.network_security_group
    route_table               = module.naming.route_table
    private_endpoint          = module.naming.private_endpoint
    network_interface         = module.naming.network_interface
    public_ip                 = module.naming.public_ip
    virtual_machine           = module.naming.virtual_machine
    linux_virtual_machine     = module.naming.linux_virtual_machine
    windows_virtual_machine   = module.naming.windows_virtual_machine
    virtual_machine_scale_set = module.naming.virtual_machine_scale_set
    kubernetes_cluster        = module.naming.kubernetes_cluster
    storage_account           = module.naming.storage_account
    managed_disk              = module.naming.managed_disk
    key_vault                 = module.naming.key_vault
    log_analytics_workspace   = module.naming.log_analytics_workspace
  }
}

output "all" {
  description = "Full raw output of the underlying Azure/naming module, exposed as an escape hatch for resource types not included in `names`."
  value       = module.naming
}
