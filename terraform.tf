terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-central-training"
    storage_account_name = "darkirondan"
    container_name       = "terracontainer"
    key                  = "terraform.tfstate"
  }

}