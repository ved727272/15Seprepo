resource "azurerm_public_ip" "pip" {
    name = "raman_frontend_pip"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    allocation_method = "Static"
    sku = "Standard"
}

