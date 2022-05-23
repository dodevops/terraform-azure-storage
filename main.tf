resource "azurerm_storage_account" "account" {
  account_replication_type = var.replication_type
  account_tier             = var.tier
  location                 = var.location
  name                     = "${lower(var.project)}${lower(var.stage)}storacc${var.suffix}"
  resource_group_name      = var.resource_group
  allow_blob_public_access = var.allow_blob_public_access
  min_tls_version          = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "2.0"
      retention_policy_days = 14
    }
  }
  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }
}

resource "azurerm_storage_container" "container" {
  name                 = "${lower(var.project)}${lower(var.stage)}storcont${var.suffix}"
  storage_account_name = azurerm_storage_account.account.name
}

resource "azurerm_storage_blob" "blob" {
  name                   = "${lower(var.project)}${lower(var.stage)}storblob${var.suffix}"
  storage_account_name   = azurerm_storage_account.account.name
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
}

resource "azurerm_storage_container" "additional_container" {
  count                 = length(var.additional_containers)
  name                  = "${lower(var.project)}${lower(var.stage)}storcont${var.additional_containers[count.index]["suffix"]}"
  storage_account_name  = azurerm_storage_account.account.name
  container_access_type = var.additional_containers[count.index]["access_type"]
}