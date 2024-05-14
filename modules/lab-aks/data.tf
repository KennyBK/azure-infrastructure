data "azurerm_application_gateway" "appgw" {
  resource_group_name = "azure-aks-rg"
  name                = "azure-aks-appgw"
}

data "azurerm_resource_group" "rg" {
  name = "azure-aks-rg"
}

