provider "azurerm" {
  features {}

  # The vended deploy identity is Contributor on the workload resource group only,
  # so it cannot register resource providers at subscription scope.
  resource_provider_registrations = "none"

  # Auth + target subscription come from the environment, never from code:
  #   local dev : az login (Azure CLI) + ARM_SUBSCRIPTION_ID
  #   CI        : GitHub OIDC via ARM_USE_OIDC + ARM_CLIENT_ID / ARM_TENANT_ID / ARM_SUBSCRIPTION_ID
}
