variable "acr" {
  type = object({
    name = string
    resource_group_name = string
    location = string

    sku = optional(string)
  })
}

variable "tags" {
  
}

# variable "role_assignment" {
#   type = map(object({

#     role_definition_name = string
#     skip_service_principal_aad_check = bool
#   }))
# }

variable "principal_id" {
  
}