# Terraform Basics

This exercise uses Terraform's built-in `terraform_data` resource. It does not authenticate to Azure, create cloud resources, or incur cost.

Run commands from this directory:

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

## What to observe

- `init` prepares the working directory.
- `fmt` checks canonical HCL formatting.
- `validate` checks whether the configuration is internally valid.
- `plan` previews the local resource and output without changing state.
- `apply` records the `terraform_data` resource in local state.
- `output` reads the value from state.
- `destroy` removes the resource from state.

Terraform creates local working data under `.terraform/` and stores local state in `terraform.tfstate`. Both are ignored by Git and must not be committed.