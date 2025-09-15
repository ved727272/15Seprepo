terraform {
  required_version = ">= 1.1.0"
  backend "azurerm" {
    resource_group_name   = "brijesh-rg"
    storage_account_name  = "brijeshstg10962"
    container_name        = "brijcontainer"
    key                   = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.44.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "cefa80e5-9af0-4e4a-9f43-e0a0491a5473"
    
  # Configuration options
}