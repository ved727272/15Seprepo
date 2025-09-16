module "rg" {
    source = "../modules/azurerm_resource_group"
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../modules/azurerm_virtual_network"
}

module "subnet" {
    depends_on = [ module.vnet ]
    source = "../modules/azurerm_subnet"
}

module "sql_server" {
    source = "../modules/azurerm_sql_server"
    resource_group_name = "raman_rg"
    resource_group_location = "west"
    sql_server_name = "raman-sql-server"
    sql_admin_username = "sqladminuser"
    sql_admin_password = "Raman@12345"
}

module "sql_database" {
    depends_on = [ module.sql_server ]
    source = "../modules/azurerm_sql_database"
    
  

}

module "lb" {
    source = "../modules/azurerm_lb"
    resource_group_name = "raman_rg"
    resource_group_location = "westus"
    lb_name = "raman_lb"
    frontend_ip_configuration_name = "raman_frontend_ip"
    frontend_pip_name = "raman_frontend_pip"
    lb_rule_name = "raman_lb_rule"
    lb_rule_frontend_port = 80
    lb_rule_backend_port = 80
}

module "virtual_machine" {
    source = "../modules/azurerm_virtual_machine"
    resource_group_name = "raman_rg"
    resource_group_location = "westus"
    vm_name = "raman_vm"
    vm_username_secret_name = "vmusername"
    vm_password_secret_name = "vmpassword"
    subnet_id = module.subnet.subnet_id
    lb_backend_address_pool_id = module.lb.lb_backend_address_pool_id
  
}
module "lb_nic_association" {
    source = "../modules/azurerm_lb_nic_association"
    resource_group_name = "raman_rg"
    resource_group_location = "westus"
    subnet_id = module.subnet.subnet_id
    lb_backend_address_pool_id = module.lb.lb_backend_address_pool_id
}

module "key_vault" {
    source = "../modules/azurerm_key_vault"
    resource_group_name = "raman_rg"
    resource_group_location = "westus"
    key_vault_name = "raman_kv"
    vm_username_secret_name = "vmusername"
    vm_username_secret_value = "adminuser"
    vm_password_secret_name = "vmpassword"
    vm_password_secret_value = "Raman@12345"

}

module "public_ip" {
    source = "../modules/azurerm_public_ip"
    resource_group_name = "raman_rg"
    resource_group_location = "westus"
    public_ip_name = "raman_frontend_pip"
  
}

