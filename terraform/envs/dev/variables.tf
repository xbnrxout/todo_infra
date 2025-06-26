variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "canadacentral"
}

variable "project_name" {
  description = "Project name prefix for resources"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
}

variable "acr_name" {
  description = "Azure Container Registry name"
  type        = string
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
}

variable "cosmos_db_name" {
  description = "MongoDB database name"
  type        = string
}

variable "mongo_collection_name" {
  description = "MongoDB collection name"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo in 'owner/repo' format"
  type        = string
}
