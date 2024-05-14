variable "tags" {
  
}

variable "network_interface" {
  type = object({
    name = string
    location = string
    resource_group_name = string

    ip_configuration = object({
      name = string
      private_ip_address_allocation = string
    })
  })
}

variable "subnet_id" {
  
}

variable "virtual_machine" {
  type = object({
    name = string
    resource_group_name = string
    location = string
    size = string
    admin_username = string
    admin_password = string
    disable_password_authentication = bool

    os_disk = object({
      caching = string
    storage_account_type = string 
    })

    admin_ssh_key = object({
      username   = string
    })

    source_image_reference = object({
      publisher =  string
      offer = string
      sku = string
      version = string
    })
    
  })
}

variable "ssh_key_public_key" {
  
}