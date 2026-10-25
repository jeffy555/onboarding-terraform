resource "azurerm_resource_group" "onboarding" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

resource "azurerm_user_assigned_identity" "onboarding" {
  name                = var.identity_name
  resource_group_name = azurerm_resource_group.onboarding.name
  location            = var.location
  tags                = local.common_tags
}

resource "azurerm_network_security_group" "onboarding" {
  name                = var.nsg_name
  resource_group_name = azurerm_resource_group.onboarding.name
  location            = var.location
  tags                = local.common_tags
}

resource "azurerm_role_assignment" "project_reader" {
  role_definition_name = var.role_name
  scope                = var.role_scope
  principal_id         = azurerm_user_assigned_identity.onboarding.principal_id
  principal_type       = "ServicePrincipal"
}
