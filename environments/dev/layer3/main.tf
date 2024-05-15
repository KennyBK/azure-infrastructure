module "aks" {
  source = "../../../modules/lab-aks"

  for_each = try(var.layer3.aks, {})

  aks = each.value.aks_object

  vnet_subnet_id = data.azurerm_subnet.aks_subnet.id

  tags = var.layer3.tag
}

module "acr" {
  source = "../../../modules/lab-acr"

  for_each = try(var.layer3.acr, {})

  principal_id = module.aks[each.value.aks_module_key].kubelet_identity_id

  acr = each.value.acr_object

  tags = var.layer3.tag
}
