variable "appgw" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string

    sku = object({
      name     = string
      tier     = string
      capacity = string
    })

    gateway_ip_configuration = object({
      name = string
    })

    frontend_port = object({
      name = string
      port = string
    })

    frontend_ip_configuration = object({
      name = string
    })

    backend_address_pool = object({
      name = string
    })

    backend_http_settings = object({
      name                  = string
      cookie_based_affinity = optional(string)
      port                  = string
      protocol              = string
      request_timeout       = number
    })

    http_listener = object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string
    })

    request_routing_rule = object({
      name                       = string
      rule_type                  = string
      priority                   = optional(number)
      http_listener_name         = string
      backend_address_pool_name  = string
      backend_http_settings_name = string
    })

    waf_configuration = object({
      enabled          = bool
      firewall_mode    = string
      rule_set_version = string
    })
  })
}

variable "gateway_ip_configuration_subnet" {

}

variable "public_ip_address_id" {

}


variable "tags" {

}