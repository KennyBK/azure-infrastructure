
module "network" {
  source = "../../../modules/lab-networking"

  for_each = try(var.layer2.network, {})

  virtual_network = each.value.virtual_network

  subnets = each.value.subnets

  public_ip = each.value.public_ip

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