locals {

  default_tags = {
    environment = var.env
    owner       = "SiqueiraD"
    app         = var.app
  }

}

resource "azurerm_resource_group" "emmilly-rg" {
  name     = "iac-${var.app}-rg"
  location = var.location
}

resource "azurerm_log_analytics_workspace" "my_first_app" {
  name                = "law-${var.app}"
  location            = azurerm_resource_group.emmilly-rg.location
  resource_group_name = azurerm_resource_group.emmilly-rg.name

  tags = local.default_tags
}

resource "azurerm_container_app_environment" "app_environment" {
  name                       = "cae-${var.app}"
  location                   = azurerm_resource_group.emmilly-rg.location
  resource_group_name        = azurerm_resource_group.emmilly-rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_first_app.id

  tags = local.default_tags
}
