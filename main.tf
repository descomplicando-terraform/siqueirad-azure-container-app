module "pre-projeto" {
  source = "./pre_container_app"
  app    = "elsa"
}
module "projetoa" {
  source = "./container_app"
  envs = [{
    name  = "ASPNETCORE_ENVIRONMENT",
    value = "Development"
  }]
  app                          = "elsa"
  container_app_environment_id = module.pre-projeto.container_app_environment_id
  instancias = {
    "server" = {
      name  = "elsa-server",
      image = "docker.io/elsaworkflows/elsa-server-v3:latest"
      envs = [{
        name  = "ASPNETCORE_ENVIRONMENT",
        value = "Development"
      }]
    },
    "studio" = {
      name  = "elsa-studio",
      image = "docker.io/elsaworkflows/elsa-studio-v3:latest"
      envs = [{
        name  = "ASPNETCORE_ENVIRONMENT",
        value = "Development"
        }, {
        name  = "ELSASERVER__URL",
        value = "https://elsa-server--74rhvcc.ambitioussand-a1d91173.eastus.azurecontainerapps.io/elsa/api"
      }]
  } }
}