terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "MonkeyWorks-backend"
    storage_account_name = "mwsabeznoj9cp6h6"
    container_name       = "mwscbe"
    key                  = "rg-test.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}


resource "azurerm_resource_group" "rg_test" {
  name     = var.rg_test_name
  location = var.rg_test_location
}

variable "rg_test_name" {
  type        = string
  description = "Resource group name"
  default     = "rg-test-key-monkeyworks"
}

variable "rg_test_location" {
  type        = string
  description = "Resource group location"
  default     = "Norway East"
}