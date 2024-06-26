resource "azurerm_public_ip" "vm_pip" {
  name = var.public_ip.name
  location = var.public_ip.location
  resource_group_name = var.public_ip.resource_group_name

  allocation_method = var.public_ip.allocation_method
}

resource "azurerm_network_interface" "nic" {
  name                = var.network_interface.name
  location            = var.network_interface.location
  resource_group_name = var.network_interface.resource_group_name

  ip_configuration {
    name                          = var.network_interface.ip_configuration.name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.network_interface.ip_configuration.private_ip_address_allocation
    public_ip_address_id = azurerm_public_ip.vm_pip.id
  }
}


resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = var.virtual_machine.name
  resource_group_name = var.virtual_machine.resource_group_name
  location            = var.virtual_machine.location
  size                = var.virtual_machine.size
  admin_username      = var.virtual_machine.admin_username
  admin_password      = var.virtual_machine.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  computer_name = var.virtual_machine.computer_name
  disable_password_authentication = var.virtual_machine.disable_password_authentication

  admin_ssh_key {
    username   = var.virtual_machine.admin_ssh_key.username
    public_key = var.ssh_key_public_key

  }

  identity {
    type = var.virtual_machine.identity.type
  }

  os_disk {
    name = var.virtual_machine.os_disk.name
    caching              = var.virtual_machine.os_disk.caching
    storage_account_type = var.virtual_machine.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.virtual_machine.source_image_reference.publisher
    offer     = var.virtual_machine.source_image_reference.offer
    sku       = var.virtual_machine.source_image_reference.sku
    version   = var.virtual_machine.source_image_reference.version
  }
}