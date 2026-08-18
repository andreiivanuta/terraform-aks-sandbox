output "cluster_name" {
  description = "Name of the AKS cluster."
  value       = azurerm_kubernetes_cluster.this.name
}

output "resource_group_name" {
  description = "Resource group the cluster is deployed into."
  value       = data.azurerm_resource_group.workload.name
}

output "oidc_issuer_url" {
  description = "AKS OIDC issuer URL, for federating workload identities to pods."
  value       = azurerm_kubernetes_cluster.this.oidc_issuer_url
}

output "expires_at" {
  description = "UTC time after which the TTL cleanup workflow may delete this cluster."
  value       = azurerm_kubernetes_cluster.this.tags["expires_at"]
}
