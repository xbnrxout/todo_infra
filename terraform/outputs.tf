output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "container_registry_name" {
  value = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "The login server of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubeconfig for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

output "aks_client_certificate" {
  description = "Base64-encoded client certificate for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive   = true
}

output "keyvault_name" {
  value = azurerm_key_vault.main.name
}

output "github_identity_client_id" {
  description = "Client ID of the GitHub OIDC user-assigned managed identity"
  value       = azurerm_user_assigned_identity.github_identity.client_id
}

output "github_identity_principal_id" {
  description = "Principal ID of the GitHub OIDC user-assigned managed identity"
  value       = azurerm_user_assigned_identity.github_identity.principal_id
} 
output "key_vault_uri" {
  value = azurerm_key_vault.main.vault_uri
}

