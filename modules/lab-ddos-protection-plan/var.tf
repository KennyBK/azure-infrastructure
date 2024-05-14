variable "ddos_protection_plan" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string
  })
}

variable "tags" {

}