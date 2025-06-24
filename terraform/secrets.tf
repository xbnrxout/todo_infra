resource "azurerm_key_vault_secret" "vite_api_url" {
  depends_on   = [azurerm_role_assignment.terraform_kv_admin]
  name         = "VITE-API-BASE-URL"
  value        = var.vite_api_base_url
  key_vault_id = azurerm_key_vault.main.id
}

# Get Cosmos DB Keys
data "azurerm_cosmosdb_account" "cosmos" {
  name                = azurerm_cosmosdb_account.cosmos.name
  resource_group_name = azurerm_cosmosdb_account.cosmos.resource_group_name
}

# Allow AKS identity to access Key Vault
resource "azurerm_key_vault_access_policy" "aks" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.aks_identity.principal_id

  secret_permissions = ["Get", "List"]
}


resource "azurerm_key_vault_access_policy" "app_mi_policy" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_user_assigned_identity.app.principal_id

  secret_permissions = [
    "Get",
    "List"
  ]

}
