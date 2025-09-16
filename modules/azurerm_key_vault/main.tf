
# data "azurerm_key_vault" "key_vault" {
#     name = "G-22-Vault"
#     resource_group_name = "gunjan-env-rg"
  
# }

# resource "azurerm_key_vault_secret" "vmusername" {
#     name = "vmusername"
#     value = "raman_admin"
#     key_vault_id = data.azurerm_key_vault.key_vault.id
  
# }


# resource "azurerm_key_vault_secret" "vmpassword" {
#     name = "vmpassword"
#     value = "Raman@12345"
#     key_vault_id = data.azurerm_key_vault.key_vault.id
  
# }

# resource "azurerm_key_vault_secret" "serverusername" {
#     name = "sqladminuser"
#     value = "ramansqlserver"
#     key_vault_id = data.azurerm_key_vault.key_vault.id
  
# }

# resource "azurerm_key_vault_secret" "serverpassword" {
#     name = "sqladminpassword"
#     value = "Brijesh@12345"
#     key_vault_id = data.azurerm_key_vault.key_vault.id
  
# }

# resource "azurerm_key_vault_secret" "vm_username" {
#   name         = var.vm_username_secret_name
#   value        = var.vm_username_secret_value
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }

# resource "azurerm_key_vault_secret" "vm_password" {
#   name         = var.vm_password_secret_name
#   value        = var.vm_password_secret_value
#   key_vault_id = data.azurerm_key_vault.key_vault.id
# }



# variable "vm_username_secret_name" {
#   type = string
# }

# variable "vm_username_secret_value" {
#   type = string
# }

# variable "vm_password_secret_name" {
#   type = string
# }

# variable "vm_password_secret_value" {
#   type = string
# }
