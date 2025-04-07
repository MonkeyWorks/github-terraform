terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "MonkeyWorks-backend"
    storage_account_name = "mwsabeznoj9cp6h6"
    container_name       = "mwscbe"
    key                  = "ws_key.terraform.tfstate"
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