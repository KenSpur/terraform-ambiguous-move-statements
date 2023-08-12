provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

# resource "azurerm_resource_group" "rg" {
#   name     = "rg-test-moved-issue"
#   location = "westeurope"
# }

moved {
  from = azurerm_resource_group.rg
  to   = module.resource_group.azurerm_resource_group.moved
}

module "resource_group" {
  source = "./module"

  name     = "rg-test-moved-issue"
  location = "westeurope"
}

# │ Error: Ambiguous move statements
# │ 
# │   on module\main.tf line 18:
# │   18: moved {
# │
# │ A statement at main.tf:19,1 declared that azurerm_resource_group.rg moved to module.resource_group.azurerm_resource_group.moved, but this statement instead declares that module.resource_group.azurerm_resource_group.main moved there.
# │
# │ Each resource can have moved from only one source resource.