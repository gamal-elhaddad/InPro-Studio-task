variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "GP_Gen5_2"
}

variable "version" {
  type    = string
  default = "11"
}

variable "admin_login" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "storage_mb" {
  type    = number
  default = 5120
}

variable "backup_retention_days" {
  type    = number
  default = 7
}

variable "geo_redundant_backup_enabled" {
  type    = bool
  default = false
}

variable "auto_grow_enabled" {
  type    = bool
  default = true
}

variable "ssl_enforcement_enabled" {
  type    = bool
  default = true
}

variable "database_name" {
  type    = string
  default = "appdb"
}

variable "database_charset" {
  type    = string
  default = "UTF8"
}

variable "database_collation" {
  type    = string
  default = "English_United States.1252"
}
