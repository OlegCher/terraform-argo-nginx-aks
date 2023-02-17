terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }

  required_version = ">= 0.14"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  # config_context = "my-context"
}


provider "azurerm" {
  features {}
}