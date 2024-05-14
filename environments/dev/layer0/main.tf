module "rg" {
  source   = "../../../modules/lab-resource-group"
  for_each = var.layer0.rg
  name     = each.value.name
  location = each.value.location

  tags = var.layer0.tag
}
