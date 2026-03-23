# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

Sentinel policy set governing Terraform Cloud/Enterprise (TFC/TFE) workspaces, OAuth clients, variables, and Terraform versions.

## Commands

```bash
# Run all policy tests
sentinel test

# Run tests for a single policy
sentinel test enforce-minimal-terraform-verions.sentinel
```

CI runs `sentinel test` via GitHub Actions using the `thrashr888/sentinel-simulator` Docker image. `.sentinel/` is gitignored — the simulator re-fetches remote modules on each run.

## Architecture

```
<policy-name>.sentinel       # Policy logic (one file per policy, at repo root)
sentinel.hcl                 # Policy set config: remote module imports + policy sources + enforcement levels
test/<policy-name>/          # Test cases (.hcl files referencing mocks)
mocks/                       # Mock tfplan/v2 data (.sentinel files) used by tests
```

## Adding a New Policy

1. Create `<policy-name>.sentinel` at the repo root.
2. Add a `policy` block to `sentinel.hcl` with its raw GitHub URL and `enforcement_level`.
3. Create `test/<policy-name>/` with at least one pass and one fail `.hcl` test case.
4. Create minimal mock files in `mocks/` — see existing provider-config mocks for the minimal structure needed.

## Sentinel API Gotchas

- **Provider config access**: use `tfplan.raw.configuration.provider_config`, not `tfplan.config.providers` — `tfplan.config` is not a valid alias in `tfplan/v2`.
- **Policies that check `tfe_*` resources** use `tfplan.resource_changes` (or the `tfplan-functions` helper). Policies that check **provider configuration** (AWS region, assume_role, etc.) use `tfplan.raw.configuration.provider_config`.
- **Test file param syntax**: `param "name" { value = "..." }` — the bare `param { key = value }` block is only valid in policy files.
- **Test module imports**: in `.hcl` test files use `module "name" { source = "..." }`, not `import "module" "name"` (that syntax is for policy `.sentinel` files only).
- Policy file named `enforce-minimal-terraform-verions.sentinel` has a typo ("verions") — match this exact spelling in `sentinel.hcl` and the test directory name.
- All policies use `enforcement_level = "advisory"` — violations warn but do not block applies.

## Existing Policies

| Policy | Checks | Key param |
|--------|--------|-----------|
| `allow-whitelisted-tags` | `tfe_workspace` tag_names in allowed list | hardcoded list |
| `allow-whitelisted-vcs-providers` | `tfe_oauth_client` service_provider must be `github` | hardcoded list |
| `disallow-global-remote-state` | `tfe_workspace` global_remote_state must not be true | — |
| `enforce-well-known-envvariables-sensitive` | `tfe_variable` known secret env vars must be sensitive | hardcoded list |
| `enforce-minimal-terraform-verions` | tfplan terraform_version meets minimum | `minimal_tf_version`, `exempt_versions` |
| `enforce-tfe-variables-must-have-description` | `tfe_variable` description must not be empty | — |
| `disallow-assuming-tfe-ec2-iam-role` | AWS provider `assume_role.role_arn` must not match param | `disallowed_role_arn` |
| `allow-aws-regions` | AWS provider `region` must be in allowed list | `allowed_aws_regions` |
