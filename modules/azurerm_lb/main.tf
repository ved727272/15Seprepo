

resource "azurerm_lb" "lb" {
  name                = "brijesh_lb"
  location            = azurerm.resource_group.rg.location
  resource_group_name = azurerm.resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "raman_frontend_ip"
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}

data "azurerm_public_ip" "pip" {
    name = "raman_frontend_pip"
    resource_group_name = "raman_rg"
  
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "raman_backend_pool"
}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "raman_lb_probe"
  protocol        = "Tcp"
  port            = 22
  interval_in_seconds = 15
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id            = azurerm_lb.lb.id
  name                       = "raman_lb_rule"
  protocol                   = "Tcp"
  frontend_port              = 80
  backend_port               = 80
  frontend_ip_configuration_name = azurerm_lb.lb.frontend_ip_configuration[0].name
 
}