data "azurerm_mssql_server" "sql_server" {
  name                = "raman-sql-server"
  resource_group_name = "raman_rg"
}
