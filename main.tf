module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.4.4"

  prefix                 = var.prefix
  suffix                 = var.suffix
  unique-seed            = var.unique_seed
  unique-length          = var.unique_length
  unique-include-numbers = var.unique_include_numbers
}
