output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.resource_group.location
}

output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = module.acr.name
}

output "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  value       = module.acr.login_server
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.name
}

output "aks_kube_config" {
  description = "Kubeconfig of the AKS cluster"
  value       = module.aks.kube_config_raw
  sensitive   = true
}

output "postgresql_server_name" {
  description = "The name of the PostgreSQL server"
  value       = module.postgresql.name
}

output "postgresql_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL server"
  value       = module.postgresql.fqdn
}

output "postgresql_admin_username" {
  description = "PostgreSQL admin username"
  value       = var.postgresql_admin_login
}

