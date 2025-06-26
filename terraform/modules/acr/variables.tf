variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where ACR will be deployed"
  type        = string
}
