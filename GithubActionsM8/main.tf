resource "random_string" "random_string" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "rg_mw" {
  name     = local.ls_rg_name
  location = var.location

  tags = {
    environment = local.ls_ws_suffix
  }
}

output "rg_mw-name" {
  value = azurerm_resource_group.rg_mw.name
}

resource "azurerm_storage_account" "sa_mw" {
  name                     = "${lower(var.sa_name)}${(random_string.random_string.result)}${lower(local.ls_ws_suffix)}"
  resource_group_name      = azurerm_resource_group.rg_mw.name
  location                 = azurerm_resource_group.rg_mw.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = local.ls_ws_suffix
  }
}

resource "azurerm_storage_account_static_website" "sa_sw_mw" {
  storage_account_id = azurerm_storage_account.sa_mw.id
  index_document     = var.index_document
}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_mw.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1>${var.source_content}${local.ls_ws_suffix}</h1>"

  depends_on = [azurerm_storage_account_static_website.sa_sw_mw]
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.sa_mw.primary_web_endpoint
}

#Test push create