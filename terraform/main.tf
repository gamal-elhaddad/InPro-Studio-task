terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "acr" {
  source              = "./modules/acr"
  name                = var.acr_name
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  sku                 = var.acr_sku
  admin_enabled       = true
}

module "aks" {
  source              = "./modules/aks"
  name                = var.aks_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  dns_prefix          = var.aks_dns_prefix
  ssh_public_key      = file(var.ssh_public_key_path)
}

module "postgresql" {
  source              = "./modules/postgresql"
  name                = var.postgresql_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  admin_login         = var.postgresql_admin_login
  admin_password      = var.postgresql_admin_password
}
