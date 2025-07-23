output "server_name" {
  value = azurerm_postgresql_server.this.name
}

output "fully_qualified_domain_name" {
  value = azurerm_postgresql_server.this.fully_qualified_domain_name
}

output "database_name" {
  value = azurerm_postgresql_database.db.name
}
