variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "eastus"
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
  default     = "myapp"
}

variable "env" {
  description = "Application env"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Location short name "
  type        = string
  default     = "eastus"
}

variable "envs" {
  description = "lista de variaveis de ambiente para container"
  type        = list(any)
}

variable "criar_instancia" {
  description = "Opção para criar instancia ou não"
  type        = bool
  default     = true
}

variable "container_app_environment_id" {
  description = "Opção para criar instancia ou não"
  type        = string
}

variable "instancias" {
  type = map(object({
    name  = string
    image = string
    envs  = list(any)
    })
  )
  description = "Mapa de instancias"
}

