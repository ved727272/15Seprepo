resource "azurerm_mssql_server" "sql_server" {
    name                         = "raman-sql-server"
    resource_group_name          = azurerm_resource_group.rg.name
    location                     = azurerm_resource_group.rg.location
    version                      = "12.0"
    administrator_login          = azurerm_sql_server.sql_admin.username
    administrator_login_password = azurerm_sql_server.sql_admin.password
    
}