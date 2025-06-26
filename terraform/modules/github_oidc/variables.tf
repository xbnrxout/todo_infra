variable "project_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "github_repo" {
  type        = string
  description = "GitHub repo name in the format 'owner/repo'"
}

variable "environment" {
  description = "The target GitHub environment (e.g. dev)"
  type        = string
}

variable "subject" {
  type        = string
  description = "The subject claim to match in the OIDC token"
}

    