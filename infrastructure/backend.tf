terraform {
  # Partial backend: concrete values are supplied at init via -backend-config, so no
  # account-specific names live in source. The workflow passes:
  #   resource_group_name  = rg-alz-management-swc          (platform management RG)
  #   storage_account_name = <platform STATE_STORAGE_ACCOUNT_NAME>
  #   container_name       = tfstate
  #   key                  = taks.tfstate                   (this workload's own state key)
  backend "azurerm" {
    use_azuread_auth = true
  }
}
