# siqueirad-azure-container-app

Módulo para criação do ambiente para aplicação [Elsa Workflows](https://v3.elsaworkflows.io/)

## Pré-requisitos

- Terraform instalado
- Conta no Azure
- [Autenticação do Terraform para Azure](https://learn.microsoft.com/pt-br/azure/developer/terraform/authenticate-to-azure)

# Processo de realização do trabalho

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="azurerm"></a> [azurerm](#provider_azurerm) | ~> 5.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                                   | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [azurerm_container_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app)                                 | resource |
| [azurerm_container_app_environment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app_environment_storage) | resource |
| [azurerm_log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)             | resource |
| [azurerm_resource_group](hhttps://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group.html)                         | resource |

## Outputs

| Name                                                                                   | Description          |
| -------------------------------------------------------------------------------------- | -------------------- |
| <a name="output_container_app_url"></a> [azurerm_container_app_url](#output_public_ip) | URL do Container App |

<!-- END_TF_DOCS -->
