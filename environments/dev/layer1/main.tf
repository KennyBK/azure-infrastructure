module "stg" {
  source   = "../../../modules/lab-storage"
  for_each = var.layer1.sa

  storage_account = each.value.storage_account_object

  containers = each.value.containers

  tags = var.layer1.tag
}
