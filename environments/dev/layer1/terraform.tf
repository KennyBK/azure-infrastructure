terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.103.1"
    }
  }

  # backend "azurerm" {
  #   storage_account_name = "tfstatestoragenguyenpdt"
  #   container_name       = "tfstate-container"
  #   key                  = "terraform.tfstate"

  # }
}
