output "azurerm_container_app_url" {
  value = [for instance in azurerm_container_app.app : instance.latest_revision_fqdn]
}