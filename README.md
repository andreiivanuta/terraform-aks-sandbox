# terraform-aks-sandbox

A security-focused learning project for creating and destroying an ephemeral Azure Kubernetes Service (AKS) development cluster with Terraform and manually triggered GitHub Actions.

## Status

The repository is in its security and architecture planning phase. It does not yet provision Azure resources.

## Security goals

- Authenticate GitHub Actions to Azure with OpenID Connect (OIDC), never client secrets.
- Keep persistent Terraform state and CI identity bootstrap resources separate from disposable AKS resources.
- Scope Azure identities to designated resource groups with least privilege.
- Protect apply and destroy operations with GitHub environments.
- Use scheduled TTL cleanup only as a fallback for abandoned resources.
- Keep credentials, state, plans, variable values, kubeconfig, and personal information out of Git and public workflow logs.
- Pin third-party GitHub Actions to immutable full commit SHAs.

## Planned repository layout

```text
bootstrap/       Persistent state and CI identity infrastructure
infrastructure/  Disposable AKS infrastructure
.github/         Workflows, dependency updates, and repository policy
docs/            Security model and operational procedures
```

See [docs/security-model.md](docs/security-model.md) for the trust boundaries and [docs/implementation-plan.md](docs/implementation-plan.md) for the resumable delivery plan before adding infrastructure or automation.

## Public repository warning

Repository content, pull requests, issues, Actions logs, and uploaded artifacts may be public. Never include credentials, Terraform state or plans, kubeconfig, tenant or subscription identifiers, personal data, or private resource names.

Report suspected vulnerabilities using GitHub private vulnerability reporting as described in [SECURITY.md](SECURITY.md).
