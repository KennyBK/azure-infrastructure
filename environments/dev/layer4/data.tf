data "azurerm_subnet" "cicd_subnet" {
  resource_group_name = "azure-aks-rg"
  virtual_network_name = "azure-aks-vnet"
  name = "CICDSubnet"
}
