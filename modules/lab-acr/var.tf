variable "acr" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string

    sku = optional(string)
  })
}

variable "tags" {

}

variable "principal_id" {

}