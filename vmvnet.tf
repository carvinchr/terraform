terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.33.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "c1c35d4f-1f50-4553-8721-15e9fe02c7f2"
  tenant_id = "962d3a7f-bd67-4087-9c4b-d7049e4a2d4f"
  client_id = "e05a95cc-945b-4586-a5e1-a8049a0b8e1f"
  client_secret = "m-c8Q~v-3yFC_UAJZzOGOzHSROxXm0zuz~6C9bvp"
  features {
    
  }
}

resource "azurerm_resource_group" "groupbyterraform" {
  name     = "terraform-1"
  location = "Australia East"
}

resource "azurerm_storage_container" "terraformdata" {
  name                  = "terraformdocument"
  storage_account_name  = "szmoondb"
  container_access_type = "blob"
  depends_on = [
    azurerm_resource_group.groupbyterraform
  ]
}

resource "azurerm_storage_blob" "terraformmain" {
  name                   = "main.tf"
  storage_account_name   = "szmoondb"
  storage_container_name = "terraformdocument"
  type                   = "Block"
  source                 = "main.tf"
  depends_on = [
    azurerm_storage_container.terraformdata
  ]
}