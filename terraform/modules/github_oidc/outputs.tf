output "client_id" {
  value = azurerm_user_assigned_identity.github_identity.client_id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.github_identity.principal_id
}
