# terraform-aks-sandbox

Infrastructure-as-Code and GitOps source for one **ephemeral Azure Kubernetes Service (AKS)** cluster. Every change to the cluster is made here and deploys through GitHub Actions using **OpenID Connect (OIDC)** — no client secrets.

This repository is a **workload**: it does not create its own trust, identities, or state backend. It consumes them from a separate platform landing zone (`azure-landing-zone`), which vends this repo least-privilege identities and provides the shared Terraform state.

## How it works (GitOps)

- A pull request runs a read-only `terraform plan` preview of the change.
- Merging to `main` applies the reviewed plan (merge = deploy).
- Separate workflows destroy the cluster and run a scheduled TTL cleanup.

Authentication uses vended identities, selected per GitHub environment:

| Environment | Identity | Access |
|---|---|---|
| `plan` | plan (Reader) | preview only |
| `apply` / `destroy` | deploy (Contributor) | create / update / delete the cluster |
| `cleanup` | cleanup (Contributor) | scheduled teardown of expired resources |

## What the platform provides

- **Vended identities** federated to this repo's environments (client IDs stored as environment values).
- **Shared Terraform state** — an Entra-ID-only storage account; this workload stores state under its own key.
- **Resource group** `rg-taks-sandbox-swc`, created by the platform; this repo deploys *into* it and never creates it.

## Layout

```text
infrastructure/      AKS Terraform (the cluster and its resources)
config/project.json  shared naming for this workload
.github/workflows/   plan / apply / destroy / ttl-cleanup
```

## Security

- GitHub Actions authenticates with OIDC; no client secrets or stored credentials.
- Vended identities are least-privilege, scoped to this workload's resource group and state key.
- Credentials, Terraform state and plans, kubeconfig, tenant/subscription identifiers, and personal data stay out of Git and public logs. Third-party Actions are pinned to full commit SHAs.

## Public repository warning

Repository content, pull requests, issues, Actions logs, and uploaded artifacts may be public. Never include credentials, Terraform state or plans, kubeconfig, tenant or subscription identifiers, personal data, or private resource names.

Report suspected vulnerabilities using GitHub private vulnerability reporting as described in [SECURITY.md](SECURITY.md).
