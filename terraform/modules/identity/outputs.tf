output "aks_identity_id" {
  value = azurerm_user_assigned_identity.aks_identity.id
}

output "sp_object_id" {
  value = azurerm_user_assigned_identity.aks_identity.principal_id
}


