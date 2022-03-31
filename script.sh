#!/bin/bash

#variables
SUB_ID="5365e79c-5e94-4bba-8cf6-4ed52f8abca0"
RG_NAME="rg-central-training"
STORAGE_ACCOUNT_NAME="darkirondan"
CONTAINER_NAME="terracontainer"

# Create storage account

echo "Creating storage account and container! 🌚 " 

# Create storage account
az storage account create --resource-group $RG_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
 
# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RG_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
 
# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY


echo "Done! your storage and container are successfully created! ✅ "

echo "Creating the service principal! 🌚 "

#create service principal
az ad sp create-for-rbac -n "replace this" --role Contributor --scopes /subscriptions/$SUB_ID/resourceGroups/$RG_NAME

echo "Done! your service principal is successfully created! ✅ save this output on a safe and local place"

