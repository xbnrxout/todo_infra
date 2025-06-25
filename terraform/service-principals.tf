data "azuread_client_config" "current" {}

variable "gh_client_id" {
  description = "Client ID of the GitHub OIDC application"
  type        = string
}

data "azuread_service_principal" "gh_actions" {
  client_id = var.gh_client_id
}

resource "azurerm_role_assignment" "gh_actions_rg" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = data.azuread_service_principal.gh_actions.object_id
}

resource "azurerm_role_assignment" "gh_actions_kv" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = data.azuread_service_principal.gh_actions.object_id
}
