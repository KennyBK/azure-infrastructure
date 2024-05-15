variable "tags" {

}

variable "network_interface" {
  type = object({
    name                = string
    location            = string
    resource_group_name = string

    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
  })
}

variable "subnet_id" {

}

variable "virtual_machine" {
  type = object({
    name                            = string
    resource_group_name             = string
    location                        = string
    size                            = string
    admin_username                  = string
    admin_password                  = optional(string)
    disable_password_authentication = optional(bool)
    computer_name = optional(string)

    os_disk = object({
      name = string
      caching              = string
      storage_account_type = string
    })

    admin_ssh_key = optional(object({
      username = string
    }))

    source_image_reference = optional(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))

    identity = optional(object({
      type = string
    }))
  })
}

variable "public_ip" {
  type = object({
    name = string
    location = string
    resource_group_name = string

    allocation_method = string
  })
}

variable "ssh_key_public_key" {

}