resource "azurerm_application_gateway" "appgw" {
  name                = var.appgw.name
  resource_group_name = var.appgw.resource_group_name
  location            = var.appgw.location

  sku {
    name     = var.appgw.sku.name
    tier     = var.appgw.sku.tier
    capacity = var.appgw.sku.capacity
  }

  gateway_ip_configuration {
    name      = var.appgw.gateway_ip_configuration.name
    subnet_id = var.gateway_ip_configuration_subnet
  }

  frontend_port {
    name = var.appgw.frontend_port.name
    port = var.appgw.frontend_port.port
  }

  frontend_ip_configuration {
    name                 = var.appgw.frontend_ip_configuration.name
    public_ip_address_id = var.public_ip_address_id
  }

  backend_address_pool {
    name = var.appgw.backend_address_pool.name
  }

  backend_http_settings {
    name                  = var.appgw.backend_http_settings.name
    cookie_based_affinity = var.appgw.backend_http_settings.cookie_based_affinity
    port                  = var.appgw.backend_http_settings.port
    protocol              = var.appgw.backend_http_settings.protocol
    request_timeout       = var.appgw.backend_http_settings.request_timeout
  }

  http_listener {
    name                           = var.appgw.http_listener.name
    frontend_ip_configuration_name = var.appgw.http_listener.frontend_ip_configuration_name
    frontend_port_name             = var.appgw.http_listener.frontend_port_name
    protocol                       = var.appgw.http_listener.protocol
  }

  request_routing_rule {
    name                       = var.appgw.request_routing_rule.name
    rule_type                  = var.appgw.request_routing_rule.rule_type
    priority = var.appgw.request_routing_rule.priority
    http_listener_name         = var.appgw.request_routing_rule.http_listener_name
    backend_address_pool_name  = var.appgw.request_routing_rule.backend_address_pool_name
    backend_http_settings_name = var.appgw.request_routing_rule.backend_http_settings_name
  }

  waf_configuration {
    enabled = var.appgw.waf_configuration.enabled
    firewall_mode = var.appgw.waf_configuration.firewall_mode
    rule_set_version = var.appgw.waf_configuration.rule_set_version
  }

  tags = var.tags
}
