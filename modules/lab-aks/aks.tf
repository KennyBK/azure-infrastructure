resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks.name
  resource_group_name = var.aks.resource_group_name
  location            = var.aks.location
  dns_prefix          = var.aks.dns_prefix
  sku_tier            = var.aks.sku_tier

  oidc_issuer_enabled = var.aks.oidc_issuer_enabled
  workload_identity_enabled = var.aks.workload_identity_enabled
  
  default_node_pool {
    name           = var.aks.default_node_pool.name
    vm_size        = var.aks.default_node_pool.vm_size
    node_count     = var.aks.default_node_pool.node_count
    vnet_subnet_id = var.vnet_subnet_id

  }

  identity {
    type = var.aks.identity.type
  }

  ingress_application_gateway {
    gateway_id = data.azurerm_application_gateway.appgw.id

  }

  network_profile {
    network_plugin = var.aks.network_profile.network_plugin
    service_cidr   = var.aks.network_profile.service_cidr
    dns_service_ip = var.aks.network_profile.dns_service_ip

  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = var.aks.key_vault_secrets_provider.secret_rotation_enabled
    secret_rotation_interval = var.aks.key_vault_secrets_provider.secret_rotation_interval
  }

  tags = var.tags
}

# Assing necessary permissions to ingress controller managed identity

resource "azurerm_role_assignment" "agic_rg_contributor" {
  principal_id         = azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
  role_definition_name = "Contributor"
  scope                = data.azurerm_resource_group.rg.id
}

