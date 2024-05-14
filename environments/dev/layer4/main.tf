# module "appservice" {
#   source = "../../../modules/lab-app-service"

#   for_each = var.layer4.appservice

#   app_service_plan = each.value.app_service_plan_object

#   linux_web_app= each.value.linux_web_app_object

#   tags = var.layer4.tag
# }

# module "pe" {
#   source = "../../../modules/lab-private-endpoint"

#   for_each = var.layer4.pe

#   private_endpoint = each.value.private_endpoint_object

#   private_connection_resource_id = {
#     "app_id" = module.appservice[each.value.app_module_key].id
#   }

#   subnet_id = data.azurerm_subnet.private_endpoint_subnet.id

#   tags = var.layer4.tag

#   depends_on = [ module.appservice ]
# }

# module "linux_vm" {
#   source = "../../../modules/lab-computing"

#   for_each = var.layer4.vm

#   network_interface = each.value.network_interface_object

#   subnet_id = data.azurerm_subnet.cicd_subnet.id

#   virtual_machine = each.value.virtual_machine_object

#   ssh_key_public_key = file("./id_rsa.pub")

#   tags = var.layer4.tag
# }

module "aks" {
  source = "../../../modules/lab-aks"

  for_each = try(var.layer4.aks, {})

  aks = each.value.aks_object

  vnet_subnet_id = data.azurerm_subnet.aks_subnet.id

  tags = var.layer4.tag
}

module "acr" {
  source = "../../../modules/lab-acr"

  for_each = try(var.layer4.acr, {})

  principal_id = module.aks[each.value.aks_module_key].kubelet_identity_id

  acr = each.value.acr_object

  tags = var.layer4.tag
}
