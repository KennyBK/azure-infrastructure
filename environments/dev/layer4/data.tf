# data "azurerm_subnet" "private_endpoint_subnet" {
#   resource_group_name = "azure-labs-rg"
#   virtual_network_name = "azure-labs-vnet"
#   name = "PrivateEndpointSubnet"
# }

# data "azurerm_subnet" "cicd_subnet" {
#   resource_group_name = "azure-labs-rg"
#   virtual_network_name = "azure-labs-vnet"
#   name = "CICDSubnet"
# }

data "azurerm_subnet" "aks_subnet" {
  resource_group_name = "azure-aks-rg"
  virtual_network_name = "azure-aks-vnet"
  name = "AksSubnet"
}
