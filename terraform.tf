terraform {
  required_version = "~> 1.7"
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.88"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.11"
    }
  }
}
