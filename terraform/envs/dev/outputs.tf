output "resource_group_name" {
  value       = module.resource_group.name
  description = "Resource group name"
}

output "acr_login_server" {
  value       = module.acr.login_server
  description = "ACR login server"
}

output "aks_name" {
  value       = module.aks.name
  description = "AKS cluster name"
}

output "keyvault_name" {
  value       = module.keyvault.name
  description = "Key Vault name"
}

output "keyvault_uri" {
  value       = module.keyvault.vault_uri
  description = "Key Vault URI"
}

output "github_oidc_principal_id" {
  value       = module.github_oidc.principal_id
  description = "Principal ID for GitHub OIDC identity"
}

output "cosmosdb_name" {
  value       = module.cosmosdb.database_name
  description = "Cosmos DB (Mongo) database name"
}
