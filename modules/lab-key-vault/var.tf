variable "key_vault" {
  type = object({
    name                            = string
    resource_group_name             = string
    sku_name                        = string
    location                        = string
    enable_rbac_authorization       = optional(bool)
    enabled_for_deployment          = optional(bool)
    enabled_for_disk_encryption     = optional(bool)
    enabled_for_template_deployment = optional(bool)
    soft_delete_retention_days      = optional(number)
    purge_protection_enabled        = optional(bool)
  })
}

variable "secrets" {
  default = {}
  
  type = map(object({
    name     = string
    key_name = optional(string)
  }))
}

variable "sa_access_key" {
  default = null
}


variable "access_policy" {
  type = map(object({
    secret_permissions      = optional(list(string))
    certificate_permissions = optional(list(string))
    key_permissions         = optional(list(string))
  }))
}

variable "tags" {

}

