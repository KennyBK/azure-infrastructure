variable "private_endpoint" {
  type = map(object({
    resource_id_key = string

    name                = string
    resource_group_name = string
    location            = string

    private_service_connection = object({
      name                 = string
      is_manual_connection = bool
      subresource_names    = any
    })
  }))
}

variable "private_connection_resource_id" {

}

variable "tags" {

}

variable "subnet_id" {

}