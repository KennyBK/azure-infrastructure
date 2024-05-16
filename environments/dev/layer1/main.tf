module "stg" {
  source   = "../../../modules/lab-storage"
  for_each = var.layer1.sa

  storage_account = each.value.storage_account_object

  containers = each.value.containers

  tags = var.layer1.tag
}

module "kv" {
  source = "../../../modules/lab-key-vault"

  for_each = var.layer1.kv

  key_vault = each.value.key_vault_object
  secrets   = each.value.secrets
  sa_access_key = {
    key1 = module.stg[each.value.stg_module_key].primary_access_key
    key2 = module.stg[each.value.stg_module_key].secondary_access_key
  }
  access_policy = each.value.access_policy

  tags = var.layer1.tag

}
