locals {

  default_tags = {
    environment = var.env
    owner       = "SiqueiraD"
    app         = var.app
  }

}


resource "azurerm_container_app" "app" {
  for_each = var.instancias
  name     = each.value["name"]

  container_app_environment_id = var.container_app_environment_id
  resource_group_name          = "iac-${var.app}-rg"
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
        for_each = each.value["envs"]
        iterator = filtro
        content {
          name  = filtro.value["name"]
          value = filtro.value["value"]
        }
      }
      name   = "${each.value["name"]}-container"
      image  = each.value["image"]
      cpu    = 0.25
      memory = "0.5Gi"
    }
  }
  tags = local.default_tags
}

