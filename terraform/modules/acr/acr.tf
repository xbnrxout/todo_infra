resource "azurerm_container_registry" "main" {
  name                     = var.acr_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  sku                      = "Standard"
  admin_enabled            = false
}

