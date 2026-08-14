# Changelog

All notable changes to this project will be documented in this file.

## Unreleased

### Added

- Public-repository security and credential-leak prevention foundation.
- Repository security model and resumable implementation plan.
- No-cloud Terraform basics exercise.
- Consistent editor, line-ending, and Git ignore rules.
- Private vulnerability reporting and credential-rotation guidance.
- Minimal Bicep trust anchor for GitHub OIDC: two resource groups, a bootstrap user-assigned managed identity, a federated credential, and resource-group-scoped role assignments.
- Bootstrap GitHub environment configured with the Azure OIDC identifiers: client and tenant IDs as environment variables and the subscription ID as an environment secret, all scoped to the `bootstrap` environment.