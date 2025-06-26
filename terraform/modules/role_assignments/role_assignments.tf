resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = var.aks_kubelet_object_id
  role_definition_name = "AcrPull"
  scope                = var.acr_id
}

resource "azurerm_role_assignment" "terraform_kv_admin" {
  principal_id         = var.terraform_object_id
  role_definition_name = "Key Vault Administrator"
  scope                = var.key_vault_id
}

resource "azurerm_role_assignment" "gh_actions_rg" {
  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = var.gh_actions_sp_object_id
}

resource "azurerm_role_assignment" "gh_actions_kv" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = var.gh_actions_sp_object_id
}

resource "azurerm_role_assignment" "aks_rg_contributor" {
  scope                = var.resource_group_id
  role_definition_name = "Contributor"
  principal_id         = var.aks_kubelet_object_id
}
