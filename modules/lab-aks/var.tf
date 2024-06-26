variable "tags" {

}

variable "aks" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = optional(string)
    sku_tier            = optional(string)

    oidc_issuer_enabled = optional(bool)
    workload_identity_enabled = optional(bool)

    default_node_pool = object({
      name       = string
      vm_size    = string
      node_count = optional(number)
    })

    identity = optional(object({
      type = string
    }))

    network_profile = optional(object({
      network_plugin = string
      service_cidr   = string
      dns_service_ip = string
    }))

    key_vault_secrets_provider = optional(object({
      secret_rotation_enabled  = bool
      secret_rotation_interval = string
    }))
  })
}

variable "vnet_subnet_id" {

}
