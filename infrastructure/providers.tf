provider "azurerm" {
  features {}

  # The vended deploy identity is Contributor on the workload resource group only,
  # so it cannot register resource providers at subscription scope.
  resource_provider_registrations = "none"

  # Auth + target subscription come from the environment, never from code:
  #   local dev : az login (Azure CLI) + ARM_SUBSCRIPTION_ID
  #   CI        : GitHub OIDC via ARM_USE_OIDC + ARM_CLIENT_ID / ARM_TENANT_ID / ARM_SUBSCRIPTION_ID
}

provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.this.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.this.kube_config[0].cluster_ca_certificate)
  }
}
