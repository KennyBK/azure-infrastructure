module "linux_vm" {
  source = "../../../modules/lab-computing"

  for_each = var.layer4.vm

  network_interface = each.value.network_interface_object

  subnet_id = data.azurerm_subnet.cicd_subnet.id

  virtual_machine = each.value.virtual_machine_object

  public_ip = each.value.public_ip_object
  
  ssh_key_public_key = file("./id_rsa.pub")

  tags = var.layer4.tag
}
