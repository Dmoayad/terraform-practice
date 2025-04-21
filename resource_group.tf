resource "azurerm_resource_group" "resource_group" {

  name     = var.resource_group_name
  location = var.location

}


resource "azurerm_service_plan" "linux_plan" {
  for_each            = var.azurerm_service_plan_name
  name                = each.value
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app" {
  for_each            = var.azurerm_linux_web_app_name
  name                = each.value
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id     = azurerm_service_plan.linux_plan[var.webapp_to_plan[each.value]].id


  site_config {
    application_stack {
      docker_image_name   = "nginx:latest"
      docker_registry_url = "https://index.docker.io"
    }
    # Explicitly set container registry as the source
    container_registry_use_managed_identity = false

    always_on = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  lifecycle {
    ignore_changes = [
      site_config[0].application_stack,
      site_config[1].application_stack,
    ]
  }
}