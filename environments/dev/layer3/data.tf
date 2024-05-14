data "azurerm_subnet" "private_endpoint_subnet" {
  resource_group_name = "azure-labs-rg"
  virtual_network_name = "azure-labs-vnet"
  name = "PrivateEndpointSubnet"
}
