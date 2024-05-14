resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.mssql_server.name
  resource_group_name          = var.mssql_server.resource_group_name
  location                     = var.mssql_server.location
  version                      = var.mssql_server.version
  administrator_login          = var.mssql_server.administrator_login
  administrator_login_password = var.mssql_server.administrator_login_password
  public_network_access_enabled = var.mssql_server.public_network_access_enabled

  tags = var.tags
}

resource "azurerm_mssql_database" "mssql_database" {
  name           = var.mssql_database.name
  server_id      = azurerm_mssql_server.mssql_server.id
  collation      = var.mssql_database.collation
  license_type   = var.mssql_database.license_type
  max_size_gb    = var.mssql_database.max_size_gb
  read_scale     = var.mssql_database.read_scale
  sku_name       = var.mssql_database.sku_name
  zone_redundant = var.mssql_database.zone_redundant
  
  tags = var.tags
}