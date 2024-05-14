resource "azurerm_service_plan" "service_plan" {
  name                = var.app_service_plan.name
  resource_group_name = var.app_service_plan.resource_group_name
  location            = var.app_service_plan.location
  os_type             = var.app_service_plan.os_type
  sku_name            = var.app_service_plan.sku_name
  # worker_count = var.app_service_plan.worker_count

  tags = var.tags
}

resource "azurerm_linux_web_app" "linux_web_app" {
  name                = var.linux_web_app.name
  resource_group_name = var.linux_web_app.resource_group_name
  location            = var.linux_web_app.location
  service_plan_id     = azurerm_service_plan.service_plan.id

  site_config {}

  tags = var.tags
}

