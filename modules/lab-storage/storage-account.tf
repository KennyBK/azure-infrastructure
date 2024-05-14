resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account.name
  resource_group_name      = var.storage_account.resource_group_name
  location                 = var.storage_account.location
  account_kind             = var.storage_account.account_kind
  account_tier             = var.storage_account.account_tier
  account_replication_type = var.storage_account.account_replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "container" {
  for_each              = try(var.containers, {})
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = each.value.container_access_type

}