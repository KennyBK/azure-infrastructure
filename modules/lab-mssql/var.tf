variable "mssql_server" {
  type = object({
    name = string
    resource_group_name = string
    location = string
    version = string
    administrator_login = string
    administrator_login_password = string 
    public_network_access_enabled = bool
  })
}

variable "mssql_database" {
  type = object({
    name = string
    collation = optional(string)  
    license_type = optional(string)
    max_size_gb = optional(number)
    read_scale = optional(bool)
    sku_name = optional(string)
    zone_redundant = optional(bool)
  })
}

variable "tags" {
  
}