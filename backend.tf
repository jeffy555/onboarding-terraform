terraform {
  backend "azurerm" {
    resource_group_name = "AICloudBuilder"
    storage_account_name = "spiritopsbackend"
    container_name = "test"
    key = "projects/jeffy555-onboarding-terraform/08274a32fc505131e08d/terraform.tfstate"
    use_azuread_auth = true
  }
}
