resource "azurerm_private_endpoint" "private_endpoint" {
  for_each = var.private_endpoint

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = each.value.private_service_connection.name
    private_connection_resource_id = var.private_connection_resource_id[each.value.resource_id_key]
    subresource_names              = each.value.private_service_connection.subresource_names
    is_manual_connection           = each.value.private_service_connection.is_manual_connection
  }

  tags = var.tags
}