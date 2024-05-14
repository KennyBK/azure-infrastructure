variable "tags" {

}

variable "network_security_groups" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string

    security_rules = optional(map(object({
      name                       = string
      priority                   = string
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = any
      source_address_prefix      = any
      destination_address_prefix = any
    })))
  }))
}

