data "azurerm_resource_group" "myterraformresource" {
  name = "rg-tf"
  # location = "Central US"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "myvirtualnetwork" {
  name                = var.nameVN
  resource_group_name = data.azurerm_resource_group.myterraformresource.name
  location            = data.azurerm_resource_group.myterraformresource.location
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "pruebaCiNet"
    address_prefix = "10.0.1.0/24"
  }
}
