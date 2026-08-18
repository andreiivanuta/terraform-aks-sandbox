# Changelog

All notable changes to this project will be documented in this file.

## Unreleased

### Added

- Security and credential-leak-prevention baseline for a public repository.
- No-cloud Terraform basics exercise.
- Consistent editor, line-ending, and Git ignore rules.
- Private vulnerability reporting and credential-rotation guidance.
- AKS workload Terraform: ephemeral cluster (Free tier, one Standard_D2as_v5 node, OIDC issuer + workload identity, Azure CNI Overlay with Cilium, TTL expiry tags) using the platform's shared state backend and vended identities.

### Changed

- Refocused the repository to a single purpose: deploy and govern one ephemeral AKS cluster as GitOps. Single-trunk on `main`; `dev` retired.

### Removed

- Bicep trust anchor, foundation bootstrap Terraform, and the `bootstrap` GitHub environment. Platform and landing-zone concerns now live in the separate `azure-landing-zone` repository.