#!/bin/bash

RESOURCE_GROUP_NAME=brijesh-rg
STORAGE_ACCOUNT_NAME=brijeshstg$RANDOM
CONTAINER_NAME=brijcontainer

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME