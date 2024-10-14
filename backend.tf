terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "descomplicandoterraform"
    container_name       = "descomplicando-terraform-2024"
    key                  = "descomplicando-terraform/siqueirad-azure-container-app/tfstate"
    use_oidc             = true
  }
}