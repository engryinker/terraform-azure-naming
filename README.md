# terraform-azure-naming

Org-standard wrapper around the [Azure Cloud Adoption Framework naming module](https://registry.terraform.io/modules/Azure/naming/azurerm/latest) (`Azure/naming/azurerm`, pinned to `0.4.4`).

Every other module in this organization's Azure Terraform module set (`terraform-azure-network`, `terraform-azure-compute`, `terraform-azure-storage`) expects names to come from here, so that resource-type abbreviations, segment ordering and uniqueness handling stay consistent across every repo and every team.

## Why a wrapper instead of calling `Azure/naming` directly

- Pins the module version in one place for the whole org.
- Gives teams one `prefix`/`suffix` contract instead of needing to know the full upstream variable surface.
- Returns a curated `names` map scoped to the resource types this org's other modules actually create, instead of the ~300 resource types the upstream module supports (the full raw result is still available via the `all` output as an escape hatch).

## Usage

```hcl
module "naming" {
  source  = "git::https://github.com/engryinker/terraform-azure-naming.git?ref=v1.0.0"

  prefix = ["contoso"]            # e.g. org / business unit
  suffix = ["app1", "prod", "eus"] # e.g. workload, environment, region
}

resource "azurerm_resource_group" "this" {
  name     = module.naming.names.resource_group.name
  location = "eastus"
}
```

See [`examples/basic`](examples/basic) for a runnable example.

## Inputs

| Name                     | Type         | Default | Description                                                            |
| ------------------------ | ------------ | ------- | ------------------------------------------------------------------------ |
| `prefix`                 | list(string) | `[]`    | Ordered prefix segments applied to every generated name.                |
| `suffix`                 | list(string) | `[]`    | Ordered suffix segments applied to every generated name.                |
| `unique_seed`            | string       | `""`    | Seed for the deterministic unique suffix (e.g. storage account names). |
| `unique_length`          | number       | `4`     | Length of the generated unique suffix.                                  |
| `unique_include_numbers` | bool         | `true`  | Whether the unique suffix may include numbers.                          |

## Outputs

| Name    | Description                                                                                  |
| ------- | --------------------------------------------------------------------------------------------- |
| `names` | Curated map (resource group, vnet, subnet, NSG, route table, VM, VMSS, AKS, storage, disk, key vault, log analytics workspace, etc.) of `{ name, name_unique }` objects. |
| `all`   | The full raw output of the underlying `Azure/naming` module, for resource types not in `names`. |

## Upgrading

Bump the `version` pin in [`main.tf`](main.tf) deliberately — this module intentionally does not float on `~>` so that every consumer across the org gets naming changes only when this repo is re-released.
