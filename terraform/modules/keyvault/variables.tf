variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tenant_id" {
  description = "Azure AD tenant ID for Key Vault"
  type        = string
}

variable "object_id" {
  description = "Object ID (principal) to assign Key Vault access"
  type        = string
}

