output "azurerm_container_app_url" {
  value = azurerm_container_app.elsa_studio.latest_revision_fqdn
}