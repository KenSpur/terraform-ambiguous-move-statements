terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.68.0"
    }
  }
}

variable "name" {
  type = string
}

variable "location" {
  type = string
}

# resource "azurerm_resource_group" "main" {
#   name     = var.name
#   location = var.location
# }

moved {
  from = azurerm_resource_group.main
  to   = azurerm_resource_group.moved
}

resource "azurerm_resource_group" "moved" {
  name     = var.name
  location = var.location
}