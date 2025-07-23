variable "resource_group_name" {
  type    = string
  default = "my-aks-rg"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "acr_name" {
  type    = string
  default = "myaksacr1234"
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

variable "aks_name" {
  type    = string
  default = "myakscluster"
}

variable "aks_dns_prefix" {
  type    = string
  default = "aksdns"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "postgresql_name" {
  type    = string
  default = "mypostgresserver123"
}

variable "postgresql_admin_login" {
  type    = string
  description = "Postgres admin username"
  default = "psqladmin"
}

variable "postgresql_admin_password" {
  type      = string
  sensitive = true
  description = "Postgres admin password"
}
