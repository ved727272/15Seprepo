resource "azurerm_subnet" "subnet" {
  name                 = "raman_subnet"
  resource_group_name  = "raman_rg"
  virtual_network_name = "raman_vnet"
  address_prefixes     = ["10.0.0.0/24"]
  
}