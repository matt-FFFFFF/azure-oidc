resource "azurerm_resource_group" "test" {
  name     = "rg-createdByAzureRM"
  location = "uksouth"
}

resource "azapi_resource" "rg_test" {
  type     = "Microsoft.Resources/resourceGroups@2023-07-01"
  name     = "rg-createdByAzAPI"
  location = "uksouth"
}
