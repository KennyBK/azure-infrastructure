data "azurerm_subnet" "aks_subnet" {
  resource_group_name  = "azure-aks-rg"
  virtual_network_name = "azure-aks-vnet"
  name                 = "AksSubnet"
}
