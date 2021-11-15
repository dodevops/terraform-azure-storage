output "access_key" {
  value = azurerm_storage_account.account.primary_access_key
}

output "connection_string" {
  value = azurerm_storage_account.account.primary_connection_string
}

output "blob_connection_string" {
  value = azurerm_storage_account.account.primary_blob_connection_string
}

output "containers" {
  value = join(" ", concat(
    [
      "${azurerm_storage_container.container.name}:${azurerm_storage_account.account.name}:${azurerm_storage_container.container.name}"
      ], [
      for cont in azurerm_storage_container.additional_container : "${cont.name}:${azurerm_storage_account.account.name}:${cont.name}"
    ]
  ))
}

output "static_host" {
  value = azurerm_storage_account.account.primary_web_host
}

output "blob_host" {
  value = azurerm_storage_account.account.primary_blob_host
}
