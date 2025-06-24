data "azuread_client_config" "current" {}

resource "azuread_application" "gh_actions" {
  display_name = "todo-gh-actions-app"
}
resource "azuread_service_principal" "gh_actions" {
  client_id = azuread_application.gh_actions.id
  owners    = [data.azuread_client_config.current.object_id]
}


# Generate a password:
resource "random_password" "sp_password" {
  length  = 32
  special = true
}

# Assign the password to the application:
resource "azuread_application_password" "gh_actions" {
  application_id = azuread_application.gh_actions.id
  end_date       = timeadd(timestamp(), "8760h")
}




resource "azurerm_role_assignment" "gh_actions_rg" {
  scope                = data.azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.gh_actions.object_id
}

resource "azurerm_role_assignment" "gh_actions_kv" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azuread_service_principal.gh_actions.object_id
}
