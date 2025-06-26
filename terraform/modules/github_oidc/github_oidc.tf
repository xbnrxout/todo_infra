resource "azurerm_user_assigned_identity" "github_identity" {
  name                = "todo-github-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_federated_identity_credential" "github_oidc" {
  name                = "github-actions"
  resource_group_name = var.resource_group_name
  parent_id           = azurerm_user_assigned_identity.github_identity.id
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  subject             = var.subject
}
