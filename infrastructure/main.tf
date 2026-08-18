locals {
  config        = jsondecode(file("${path.module}/../config/project.json"))
  workload_name = local.config.workloadName
  location_code = local.config.locationCode

  # Deploy into the platform-vended resource group; override only if it differs.
  resource_group_name = coalesce(var.resource_group_name, "rg-${local.workload_name}-sandbox-${local.location_code}")
  cluster_name        = "aks-${local.workload_name}-${local.location_code}"

  common_tags = merge(var.tags, {
    created_at = time_static.created.rfc3339
    expires_at = timeadd(time_static.created.rfc3339, "${var.ttl_hours}h")
  })
}

# Pins the creation time in state so the expiry tag stays stable across applies.
resource "time_static" "created" {}

# The workload resource group is created by the platform vending; we deploy INTO it.
data "azurerm_resource_group" "workload" {
  name = local.resource_group_name
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = local.cluster_name
  location            = data.azurerm_resource_group.workload.location
  resource_group_name = data.azurerm_resource_group.workload.name
  dns_prefix          = local.workload_name
  kubernetes_version  = var.kubernetes_version
  sku_tier            = "Free"

  # Enable workload identity federation for pods (no in-cluster secrets).
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  default_node_pool {
    name       = "system"
    vm_size    = var.node_size
    node_count = var.node_count
  }

  identity {
    type = "SystemAssigned"
  }

  # Azure CNI Overlay with the Cilium data plane and network policy.
  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "cilium"
    network_data_plane  = "cilium"
  }

  tags = local.common_tags
}
