variable "resource_group_name" {
  description = "Existing workload resource group created by the platform vending. Leave null to derive rg-<workload>-sandbox-<location_code>."
  type        = string
  default     = null
}

variable "node_size" {
  description = "VM size for the single AKS node pool."
  type        = string
  default     = "Standard_D2as_v5"
}

variable "node_count" {
  description = "Number of nodes in the default pool."
  type        = number
  default     = 1

  validation {
    condition     = var.node_count >= 1 && var.node_count <= 3
    error_message = "node_count must be between 1 and 3 for this sandbox."
  }
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version. Null uses the current AKS default for the region."
  type        = string
  default     = null
}

variable "ttl_hours" {
  description = "Hours until the cluster is considered expired by the TTL cleanup workflow."
  type        = number
  default     = 4
}

variable "tags" {
  description = "Base tags merged onto every resource this configuration creates."
  type        = map(string)
  default = {
    workload   = "taks"
    managed_by = "terraform"
    lifecycle  = "disposable"
  }
}
