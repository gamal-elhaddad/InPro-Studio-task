resource "azurerm_postgresql_server" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  version             = var.version

  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  storage_mb                    = var.storage_mb
  backup_retention_days         = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled             = var.auto_grow_enabled
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
}

resource "azurerm_postgresql_database" "db" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.this.name
  charset             = var.database_charset
  collation           = var.database_collation
}
