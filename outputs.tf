## Outputs ##

# Example attributes available for output
output "id" {
  value = azurerm_kubernetes_cluster.aks_demo.id
}

output "client_key" {
  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.cluster_ca_certificate
}

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks_demo.kube_config_raw
# }

output "host" {
  value = azurerm_kubernetes_cluster.aks_demo.kube_config.0.host
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_demo.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_demo.name
}