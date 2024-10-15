# siqueirad-azure-container-app

Módulo para criação do ambiente para testar a aplicação Elsa Workflows como parte do curso "Descomplicando o Terraform" da [Linuxtips](https://linuxtips.io/).

## Pré-requisitos

- Terraform instalado
- Conta no Azure
- [Autenticação do Terraform para Azure](https://learn.microsoft.com/pt-br/azure/developer/terraform/authenticate-to-azure)

# Processo de realização do trabalho

Primeiramente planejava construir um módulo para prover uma aplicação web com banco de dados, tanto em ambiente de desenvolvimento quanto de produção. Mas devido ao atropelo irracional imposto pelo modo de produção atual e as obrigações sociais, o escopo deste trabalho foi reduzido: A aplicação [Elsa Workflows](https://v3.elsaworkflows.io/) foi escolhida para ser testada num ambiente simples.

- ## Uma única aplicação de container - Error: Self-referential block
  Tive um problema em implementar uma [única aplicação com o servidor e studio](https://v3.elsaworkflows.io/docs/installation/docker#elsa-server-studio), pois precisava definir a variável de ambiente `HTTP__BASEURL` com o valor [retornado](#Outputs) pelo recurso.  
  Aconteceu o erro: `Error: Self-referential block`, então a solução mais simples foi separar em duas aplicações de container (Servidor e Studio).

## Providers

| Name                                                | Version |
| --------------------------------------------------- | ------- |
| <a name="azurerm"></a> [azurerm](#provider_azurerm) | ~> 3.0  |

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

| Name                                                                          | Description          |
| ----------------------------------------------------------------------------- | -------------------- |
| <a name="output_container_app_url"></a> [azurerm_container_app_url](#Outputs) | URL do Container App |

<!-- END_TF_DOCS -->
