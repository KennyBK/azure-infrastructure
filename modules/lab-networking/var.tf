variable "tags" {

}

variable "ddos_protection_plan_id" {
  default = null
}

variable "virtual_network" {
  type = object({
    name                        = string
    location                    = string
    resource_group_name         = string
    address_space               = list(string)
    ddos_protection_plan_enable = optional(bool)
  })
}

variable "subnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    address_prefixes    = list(string)

    nsg_key = optional(string)
  }))
}

variable "public_ip" {
  default = null
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = optional(string)
  })
}

variable "nsgs_id" {
  default = false
}