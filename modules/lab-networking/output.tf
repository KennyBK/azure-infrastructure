output "subnets_id" {
  value = {
    for key, subnets in azurerm_subnet.subnets : key => subnets.id
  }
}

output "public_ip_id" {
  value = azurerm_public_ip.pip.id
}