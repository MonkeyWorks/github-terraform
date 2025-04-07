locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"
  rg-ws-name        = "${var.rg-ws-name}-${local.workspaces_suffix}"
}


resource "random_string" "random_string" {
  length  = 5
  special = false
  upper   = false
}


resource "azurerm_resource_group" "rg-ws" {
  name     = local.rg-ws-name
  location = var.rg-ws-location
}

output "rg-ws-name" {
  value = azurerm_resource_group.rg-ws.name
}


resource "azurerm_storage_account" "sa-ws" {
  name                     = "${lower(var.sa-ws-name)}${random_string.random_string.result}${lower(local.workspaces_suffix)}"
  resource_group_name      = azurerm_resource_group.rg-ws.name
  location                 = azurerm_resource_group.rg-ws.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.workspaces_suffix
  }
}

resource "azurerm_storage_account_static_website" "sa-sw-ws" {
  storage_account_id = azurerm_storage_account.sa-ws.id
  index_document     = var.index_document
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa-ws.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>${var.source_content}${local.workspaces_suffix}</h1>"
}


output "primary_web_endpoint" {
  value = azurerm_storage_account.sa-ws.primary_web_endpoint
}