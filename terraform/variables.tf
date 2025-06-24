variable "location" {
  type    = string
  default = "canadacentral"
}

variable "subscription_id" {
  description = "The Azure subscription ID"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "acr_name" {
  type = string
}

variable "aks_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vite_api_base_url" {
  description = "The base URL for the frontend to call the backend API"
  type        = string
  default     = "http://localhost:5050"
}

variable "cosmos_account_name" {
  type        = string
  description = "Name of the Cosmos DB account"
}

variable "cosmos_db_name" {
  type        = string
  description = "Name of the Cosmos MongoDB database"
}

variable "mongo_collection_name" {
  type        = string
  description = "MongoDB collection name"
}
variable "environment" {
  description = "Environment (dev/stage/prod)"
  type        = string
}

variable "github_repo" {
  description = "GitHub repo name in owner/repo format"
  type        = string
}
