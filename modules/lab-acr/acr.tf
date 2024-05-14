resource "azurerm_container_registry" "acr" {
  name                = var.acr.name
  resource_group_name = var.acr.resource_group_name
  location            = var.acr.location
  sku                 = var.acr.sku

  tags = var.tags
}

resource "azurerm_role_assignment" "attach_aks_to_acr" {
  principal_id                     = var.principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true

  depends_on = [azurerm_container_registry.acr]
}