resource "azurerm_network_interface_backend_address_pool_association" "nic_association" {
  network_interface_id    = azurerm_network_interface.vm_nic.id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.example.id
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "vm_nic1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}