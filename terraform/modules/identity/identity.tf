resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "${var.project_name}-aks-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
}
