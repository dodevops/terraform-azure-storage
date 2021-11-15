variable "project" {
  type        = string
  description = "Three letter project key"
}

variable "stage" {
  type        = string
  description = "Stage for this ip"
}

variable "location" {
  type        = string
  description = "Azure location to use"
}

variable "resource_group" {
  type        = string
  description = "Azure Resource Group to use"
}

variable "suffix" {
  type        = string
  description = "Additional name suffix"
  default     = ""
}

variable "tier" {
  type        = string
  description = "Account tier to use (Standard/Premium)"
  default     = "Standard"
}

variable "replication_type" {
  type        = string
  description = "Replication Type to use (LRS, GRS, RAGRS, ZRS)"
  default     = "LRS"
}

variable "allow_blob_public_access" {
  type        = bool
  description = "Allow public access of the storage account, for example for a static website - will create $web storage container"
  default     = false
}

variable "static_website_index_document" {
  type        = string
  description = "Index document if public access is allowed, example: index.html"
  default     = ""
}

variable "static_website_error_404_document" {
  type        = string
  description = "Error document for code 404 if public access is allowed, example: 404.html"
  default     = ""
}

variable "additional_containers" {
  type = list(object({
    suffix      = string,
    access_type = string
  }))
  description = <<EOL
Additional containers to create:

* suffix: Suffix to add to the container name
* access_type: Maps to container_access_type
EOL
  default     = []
}
