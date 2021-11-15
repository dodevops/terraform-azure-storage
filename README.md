# Terraform storage management (for Azure)

## Introduction

This module manages Azure storage

## Usage

Instantiate the module by calling it from Terraform like this:

```hcl
module "storage" {
  source = "dodevops/storage/azure"
  version = "<version>"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

The following providers are used by this module:

- azurerm

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_storage_account.account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) (resource)
- [azurerm_storage_blob.blob](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) (resource)
- [azurerm_storage_container.additional_container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) (resource)
- [azurerm_storage_container.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) (resource)

## Required Inputs

The following input variables are required:

### location

Description: Azure location to use

Type: `string`

### project

Description: Three letter project key

Type: `string`

### resource\_group

Description: Azure Resource Group to use

Type: `string`

### stage

Description: Stage for this ip

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### additional\_containers

Description: Additional containers to create:

* suffix: Suffix to add to the container name
* access\_type: Maps to container\_access\_type

Type:

```hcl
list(object({
    suffix      = string,
    access_type = string
  }))
```

Default: `[]`

### allow\_blob\_public\_access

Description: Allow public access of the storage account, for example for a static website - will create $web storage container

Type: `bool`

Default: `false`

### replication\_type

Description: Replication Type to use (LRS, GRS, RAGRS, ZRS)

Type: `string`

Default: `"LRS"`

### static\_website\_error\_404\_document

Description: Error document for code 404 if public access is allowed, example: 404.html

Type: `string`

Default: `""`

### static\_website\_index\_document

Description: Index document if public access is allowed, example: index.html

Type: `string`

Default: `""`

### suffix

Description: Additional name suffix

Type: `string`

Default: `""`

### tier

Description: Account tier to use (Standard/Premium)

Type: `string`

Default: `"Standard"`

## Outputs

The following outputs are exported:

### access\_key

Description: n/a

### blob\_connection\_string

Description: n/a

### blob\_host

Description: n/a

### connection\_string

Description: n/a

### containers

Description: n/a

### static\_host

Description: n/a
<!-- END_TF_DOCS -->

## Development

Use [terraform-docs](https://terraform-docs.io/) to generate the API documentation by running

    terraform fmt .
    terraform-docs .
