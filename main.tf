locals {

  default_tags = {
    environment = var.env
    owner       = "SiqueiraD"
    app         = var.app
  }

}

resource "azurerm_resource_group" "emmilly-rg" {
  name     = "iac-webapi_mssql__rg"
  location = "eastus"
}

resource "azurerm_log_analytics_workspace" "my_first_app" {
  name                = "law-descomplicando-terraform"
  location            = azurerm_resource_group.emmilly-rg.location
  resource_group_name = azurerm_resource_group.emmilly-rg.name

  tags = local.default_tags
}
resource "azurerm_container_app_environment" "my_first_app" {
  name                       = "cae-iac"
  location                   = azurerm_resource_group.emmilly-rg.location
  resource_group_name        = azurerm_resource_group.emmilly-rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.my_first_app.id

  tags = local.default_tags
}

resource "azurerm_container_app" "elsa_server" {
  name = "ca-server-iac"

  container_app_environment_id = azurerm_container_app_environment.my_first_app.id
  resource_group_name          = azurerm_resource_group.emmilly-rg.name
  revision_mode                = "Single"


  ingress {
    allow_insecure_connections = true
    external_enabled           = true
    target_port                = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      env {
        name  = "ASPNETCORE_ENVIRONMENT"
        value = "Development"
      }
      name   = "elsa-server-container"
      image  = "docker.io/elsaworkflows/elsa-server-v3:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  tags = local.default_tags
}

resource "azurerm_container_app" "elsa_studio" {
  name = "ca-studio-iac"

  container_app_environment_id = azurerm_container_app_environment.my_first_app.id
  resource_group_name          = azurerm_resource_group.emmilly-rg.name
  revision_mode                = "Single"


  ingress {
    allow_insecure_connections = true
    external_enabled           = true
    target_port                = 8080
    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }

  template {
    container {
      env {
        name  = "ASPNETCORE_ENVIRONMENT"
        value = "Development"
      }
      env {
        name  = "ELSASERVER__URL"
        value = "https://${azurerm_container_app.elsa_server.ingress[0].fqdn}/elsa/api"
      }
      name   = "elsa-image-container"
      image  = "docker.io/elsaworkflows/elsa-studio-v3:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  tags = local.default_tags
}
