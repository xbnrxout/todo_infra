output "aks_acr_pull_role_id" {
  value       = azurerm_role_assignment.aks_acr_pull.id
  description = "Role assignment ID for AKS to pull from ACR"
}

output "terraform_kv_admin_role_id" {
  value       = azurerm_role_assignment.terraform_kv_admin.id
  description = "Role assignment ID for Terraform to manage Key Vault"
}

output "gh_actions_rg_role_id" {
  value       = azurerm_role_assignment.gh_actions_rg.id
  description = "Role assignment ID for GitHub OIDC to contribute to the resource group"
}

output "gh_actions_kv_role_id" {
  value       = azurerm_role_assignment.gh_actions_kv.id
  description = "Role assignment ID for GitHub OIDC to read Key Vault secrets"
}
