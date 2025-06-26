variable "aks_kubelet_object_id" {
  type = string
  default = null
}

variable "terraform_object_id" {
  type = string
  default = null
}

variable "github_identity_principal_id" {
  type = string
  default = null
}

variable "key_vault_id" {
  type = string
  default = null
}

variable "acr_id" {
  type = string
  default = null
}

variable "resource_group_id" {
  type = string
  default = null
}


variable "gh_actions_sp_object_id" {
  type = string
  default = null
}

variable "scope_id" {
  description = "The Azure resource ID to assign roles on."
  type        = string
  default = null
}

variable "principal_ids" {
  description = "List of principal object IDs to assign."
  type        = list(string)
  default = null
}

variable "role_definition_name" {
  description = "Azure built-in role name."
  type        = string
  default = null
}

