resource "azurerm_virtual_network" "virtual_nerwork" {
  name                = "raman_vnet"
  address_space       = [ "10.0.0.0/16"]
  location            = "westus"
  resource_group_name = "raman_rg"
  
}

