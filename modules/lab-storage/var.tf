variable "storage_account" {
  type = object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_kind             = string
    account_tier             = string
    account_replication_type = string
  })
}

variable "containers" {
  default = {}
  
  type = map(object({
    name                  = string
    container_access_type = string
  }))
}

variable "tags" {

}