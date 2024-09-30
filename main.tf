provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "sql" {
  name     = "db_grp"
  location = "East us"
}

resource "azurerm_mssql_server" "example" {
  name                         = "example-sqlserver"
  resource_group_name          = azurerm_resource_group.sql.name
  location                     = azurerm_resource_group.sql.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "Admin@123"
}
