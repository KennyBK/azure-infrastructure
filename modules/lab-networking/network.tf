resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network.name
  location            = var.virtual_network.location
  resource_group_name = var.virtual_network.resource_group_name
  address_space       = var.virtual_network.address_space

  tags = var.tags
}

resource "azurerm_subnet" "subnets" {
  for_each             = try(var.subnets, {})
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes

  depends_on = [azurerm_virtual_network.vnet]
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  for_each                  = var.nsgs_id ? try(var.subnets, {}) : {}
  subnet_id                 = azurerm_subnet.subnets[each.key].id
  network_security_group_id = var.nsgs_id[each.value.nsg_key]

  depends_on = [azurerm_subnet.subnets]
}

resource "azurerm_public_ip" "pip" {
  name                = var.public_ip.name
  resource_group_name = var.public_ip.resource_group_name
  location            = var.public_ip.location
  allocation_method   = var.public_ip.allocation_method
  sku                 = var.public_ip.sku

  tags = var.tags
}