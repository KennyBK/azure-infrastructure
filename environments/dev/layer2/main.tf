# module "nsg" {
#   source = "../../../modules/lab-network-security-group"

#   for_each = try(var.layer2.nsg, {})

#   network_security_groups = each.value.nsg_map

#   tags = var.layer2.tag
# }

# module "ddos" {
#   source = "../../../modules/lab-ddos-protection-plan"

#   for_each = try(var.layer2.ddos, {})

#   ddos_protection_plan = each.value.ddos_object
#   tags                 = var.layer2.tag

# }

module "network" {
  source = "../../../modules/lab-networking"

  for_each = try(var.layer2.network, {})

  virtual_network         = each.value.virtual_network
  # ddos_protection_plan_id = try(module.ddos[each.value.ddos_module_key].ddos_id, null)

  subnets = each.value.subnets

  public_ip = each.value.public_ip

  # nsgs_id = module.nsg[each.value.nsg_module_key].nsgs_id

  tags = var.layer2.tag
}

module "appgw" {
  source = "../../../modules/lab-application-gateway"

  for_each = try(var.layer2.appgw, {})

  appgw = each.value.appgw_object

  gateway_ip_configuration_subnet = module.network[each.value.network_module_key].subnets_id[each.value.subnet_key]

  public_ip_address_id = module.network[each.value.network_module_key].public_ip_id

  tags = var.layer2.tag
}