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


resource "azurerm_container_app" "app" {
  name = "ca-${var.app}"

  container_app_environment_id = var.container_app_environment_id
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
      dynamic "env" {
        for_each = var.envs
        iterator = filtro
        content {
          name  = filtro.value["name"]
          value = filtro.value["value"]
        }
      }
      name   = "${var.app}-container"
      image  = "docker.io/elsaworkflows/elsa-server-and-studio-v3:latest"
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  tags = local.default_tags
}

resource "azapi_update_resource" "example" {
  type        = "Microsoft.App/containerApps@2022-10-01"
  resource_id = azurerm_container_app.app.id
  depends_on  = [azurerm_container_app.app]

  body = jsonencode({
    properties = {
      template = {
        containers = [
          {
            env = [
              {
                name  = "HTTP__BASEURL"
                value = "https://${azurerm_container_app.app.latest_revision_fqdn}"
              },
              {
                name  = "ELSASERVER__URL"
                value = "https://${azurerm_container_app.app.latest_revision_fqdn}/elsa/api/"
              }
            ]
          }
        ]
      }
    }
  })

}

