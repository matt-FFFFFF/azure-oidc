# Azure OIDC

An example repo showing how to authenticate GitHub Actions to Azure using OIDC.

This uses no shared secrets, and instead uses the GitHub Actions runner's identity to authenticate to Azure.

## Backend

The backend is an Azure storage account, that also uses OIDC to authenticate.

The backend must be configured with the following options, using:

- `terraform {}` block
- `-backend-config=mybackend.hcl` file
- `-backend-config="key=value"` CLI arguments
- Environment variables (where possible)

> Many `ARM_*` environment variables are shared between the AzureRM provider and the backend. E.g. ARM_CLIENT_ID, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_USE_OIDC, etc.

See <https://developer.hashicorp.com/terraform/language/settings/backends/azurerm> for more information.

```terraform
client_id            = "00000000-0000-0000-0000-000000000000"
container_name       = "mystoragecontainer"
key                  = "my.tfstate"
resource_group_name  = "my-resource-group"
storage_account_name = "mystorageaccount"
subscription_id      = "00000000-0000-0000-0000-000000000000"
tenant_id            = "00000000-0000-0000-0000-000000000000"
use_oidc             = true
```

## AzureRM Provider

The AzureRM provider must be configured with the following options:

- `provider "azurerm" {}` block
- Environment variables

> Many `ARM_*` environment variables are shared between the AzureRM provider and the backend. E.g. ARM_CLIENT_ID, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_USE_OIDC, etc.

An example of the provider block is shown below:

```terraform
provider "azurerm" {
  use_oidc = true
  features {}
}
```

## AzAPI Provider

The AzAPI provider must be configured with the following options:

- `provider "azapi" {}` block
- Environment variables

> Many `ARM_*` environment variables are shared between the AzureRM and AzAPI providers. E.g. ARM_CLIENT_ID, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_USE_OIDC, etc.

```terraform
provider "azapi" {
  use_oidc = true
}
```

## GitHub Actions

The GitHub Actions workflow must be configured with the following options:

```yaml
permissions:
  id-token: write
  contents: read
```
