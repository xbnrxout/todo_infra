    provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
    }

    provider "azuread" {}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.34.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 3.0.0"
    }
  }

  required_version = ">= 1.4.0"

  backend "azurerm" {
    resource_group_name   = "tfstate-rg"
    storage_account_name  = "tfstatestorage6092"
    container_name        = "tfstate"
    key                   = "dev.tfstate"
    use_oidc              = true
    use_azuread_auth      = true
    tenant_id             = "33f41344-f538-4bc2-8974-ea61752ae066"
    client_id             = "20a10fb6-333a-4582-982d-d649a13b204d"
  }
}


    data "azurerm_client_config" "current" {}

    module "resource_group" {
    source       = "../../modules/resource_group"
    project_name = var.project_name
    environment  = var.environment
    location     = var.location
    }

    module "acr" {
    source              = "../../modules/acr"
    acr_name            = var.acr_name
    resource_group_name = module.resource_group.name
    location            = var.location
    }

    module "aks" {
    source              = "../../modules/aks"
    aks_name = var.aks_name
    project_name        = var.project_name
    environment         = var.environment
    location            = var.location
    resource_group_name = module.resource_group.name
    dns_prefix          = "${var.project_name}-${var.environment}-dns"
    }

    module "cosmosdb" {
    source              = "../../modules/cosmosdb"
    project_name        = var.project_name
    environment         = var.environment
    location            = var.location
    resource_group_name = module.resource_group.name

    database_name       = var.cosmos_db_name
    collection_name     = var.mongo_collection_name
    }


    module "identity" {
    source              = "../../modules/identity"
    project_name        = var.project_name
    location            = var.location
    resource_group_name = module.resource_group.name
    }

    module "keyvault" {
    source              = "../../modules/keyvault"
    project_name        = var.project_name
    environment         = var.environment
    location            = var.location
    resource_group_name = module.resource_group.name
    tenant_id           = data.azurerm_client_config.current.tenant_id
    object_id           = data.azurerm_client_config.current.object_id
    }

    module "github_oidc" {
    source              = "../../modules/github_oidc"
    project_name        = var.project_name
    environment         = var.environment
    location            = var.location
    resource_group_name = module.resource_group.name
    github_repo         = var.github_repo
    subject             = "repo:${var.github_repo}:ref:refs/heads/main"
    }


    module "role_assign_acr" {
    source = "../../modules/role_assignments"

    key_vault_id                 = module.keyvault.id
    acr_id                      = module.acr.id
    resource_group_id           = module.resource_group.id
    aks_kubelet_object_id       = module.aks.kubelet_object_id
    terraform_object_id         = data.azurerm_client_config.current.object_id
    github_identity_principal_id = module.github_oidc.principal_id
    gh_actions_sp_object_id     = module.identity.sp_object_id

    # Optional: provide scope/role if needed
    role_definition_name        = "AcrPull"
    scope_id                    = module.acr.id
    principal_ids               = [module.aks.kubelet_object_id]
    }


    module "role_assign_kv" {
    source                        = "../../modules/role_assignments"
    scope_id                      = module.keyvault.id
    principal_ids                 = [
        module.github_oidc.principal_id,
        module.aks.kubelet_object_id,
        data.azurerm_client_config.current.object_id
    ]
    role_definition_name          = "Key Vault Secrets User"

    aks_kubelet_object_id         = module.aks.kubelet_object_id
    github_identity_principal_id = module.github_oidc.principal_id
    terraform_object_id           = data.azurerm_client_config.current.object_id
    key_vault_id                  = module.keyvault.id
    acr_id                        = module.acr.id
    resource_group_id             = module.resource_group.id
    gh_actions_sp_object_id       = module.identity.sp_object_id
    }


    module "role_assign_rg" {
    source                         = "../../modules/role_assignments"
    scope_id                       = module.resource_group.id
    principal_ids                  = [module.github_oidc.principal_id]
    role_definition_name           = "Contributor"

    terraform_object_id            = data.azurerm_client_config.current.object_id
    acr_id                         = module.acr.id
    gh_actions_sp_object_id        = module.identity.sp_object_id
    aks_kubelet_object_id          = module.aks.kubelet_object_id
    github_identity_principal_id   = module.github_oidc.principal_id
    key_vault_id                   = module.keyvault.id
    resource_group_id              = module.resource_group.id
    }
