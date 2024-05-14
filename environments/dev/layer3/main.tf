module "stg" {
  source   = "../../../modules/lab-storage"
  for_each = var.layer3.sa

  storage_account = each.value.storage_account_object

  tags = var.layer3.tag
}

module "kv" {
  source = "../../../modules/lab-key-vault"

  for_each = var.layer3.kv

  key_vault = each.value.key_vault_object

  access_policy = each.value.access_policy

  tags = var.layer3.tag

}

module "mssql" {
  source = "../../../modules/lab-mssql"

  for_each = var.layer3.mssql

  mssql_server = each.value.mssql_server_object

  mssql_database = each.value.mssql_database_object

  tags = var.layer3.tag
}

module "pe" {
  source = "../../../modules/lab-private-endpoint"

  for_each = var.layer3.pe

  private_endpoint = each.value.private_endpoint_object

  private_connection_resource_id = {
    "stg_id" = module.stg[each.value.stg_module_key].id
    "kv_id" = module.kv[each.value.kv_module_key].id
    "mssql_id" = module.mssql[each.value.mssql_module_key].sql_server_id
  }

  subnet_id = data.azurerm_subnet.private_endpoint_subnet.id

  tags = var.layer3.tag

  depends_on = [ module.kv, module.mssql, module.stg ]
}