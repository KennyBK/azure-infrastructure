resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = var.ddos_protection_plan.name
  location            = var.ddos_protection_plan.location
  resource_group_name = var.ddos_protection_plan.resource_group_name

  tags = var.tags
}