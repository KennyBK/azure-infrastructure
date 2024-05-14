resource "azurerm_key_vault" "key_vault" {
  name                            = var.key_vault.name
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  resource_group_name             = var.key_vault.resource_group_name
  sku_name                        = var.key_vault.sku_name
  location                        = var.key_vault.location
  enable_rbac_authorization       = var.key_vault.enable_rbac_authorization
  enabled_for_deployment          = var.key_vault.enabled_for_deployment
  enabled_for_disk_encryption     = var.key_vault.enabled_for_disk_encryption
  enabled_for_template_deployment = var.key_vault.enabled_for_template_deployment
  soft_delete_retention_days      = var.key_vault.soft_delete_retention_days
  purge_protection_enabled        = var.key_vault.purge_protection_enabled
}


resource "azurerm_key_vault_access_policy" "access_policy" {
  for_each = try(var.access_policy, {})

  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions      = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions
  key_permissions         = each.value.key_permissions
}

resource "azurerm_key_vault_secret" "access_key_secret" {
  for_each     = try(var.secrets, {})
  name         = each.value.name
  value        = var.sa_access_key[each.value.key_name]
  key_vault_id = azurerm_key_vault.key_vault.id
}



