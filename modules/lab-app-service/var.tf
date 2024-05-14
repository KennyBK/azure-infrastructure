variable "tags" {
  
}

variable "app_service_plan" {
  type = object({
    name = string
    resource_group_name = string
    location = string
    os_type = string
    sku_name = string
    # worker_count = number
  })
}

variable "linux_web_app" {
  type = object({
    name = string
    resource_group_name = string
    location = string
  })
}
