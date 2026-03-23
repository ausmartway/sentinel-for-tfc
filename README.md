# sentinel-for-tfc

Test Status:
![sentinel test status:](https://github.com/ausmartway/sentinel-for-tfc/workflows/sentinel/badge.svg)

## Overview

A [Sentinel](https://developer.hashicorp.com/sentinel) policy set for
Terraform Cloud/Enterprise (TFC/TFE) that governs workspace configuration,
VCS connections, variables, and Terraform versions. All policies use
`advisory` enforcement — violations produce warnings in the run UI but
never block a plan or apply.

## Attaching to Terraform Cloud/Enterprise

1. In TFC/TFE, go to **Settings → Policy Sets → Connect a new policy set**.
2. Connect this repository via VCS or enter the GitHub URL directly.
3. Set the **Policies path** to the repository root (leave blank).
4. Select the workspaces or projects this policy set should govern.
5. For policies that require parameters, add the values in the
   **Parameters** section of the policy set (see each policy below).

## Policies

### `allow-whitelisted-tags`

Checks that all `tfe_workspace` resources only use tags from an allowed
list. Workspaces with tags outside the list will trigger a warning.

### `allow-whitelisted-vcs-providers`

Checks that `tfe_oauth_client` resources only use `github` as the VCS
service provider. Other providers (GitLab, Bitbucket, etc.) will trigger
a warning.

### `disallow-global-remote-state`

Checks that no `tfe_workspace` has `global_remote_state = true`. Enabling
global remote state exposes all workspace outputs to every other workspace
in the organisation.

### `enforce-well-known-envvariables-sensitive`

Checks that well-known secret environment variables (e.g.
`AWS_SECRET_ACCESS_KEY`, `ARM_CLIENT_SECRET`, `VAULT_TOKEN`) are marked
`sensitive = true` in `tfe_variable` resources. Non-sensitive secrets are
readable by anyone with workspace access.

### `enforce-minimal-terraform-versions`

Checks that the Terraform version used in the plan meets a minimum version
requirement.

**Parameters:**

| Parameter | Default | Description |
|-----------|---------|-------------|
| `minimal_tf_version` | `1.10.0` | Minimum acceptable Terraform version |
| `exempt_versions` | `["1.3.10","1.2.9"]` | Versions exempt from the check |

### `enforce-tfe-variables-must-have-description`

Checks that all `tfe_variable` resources being created or updated have a
non-empty `description`. Undescribed variables make it hard for teammates
to understand what a variable does.

### `disallow-assuming-tfe-ec2-iam-role`

Checks that the AWS provider is not configured to assume a specific blocked
IAM role ARN. Intended to prevent workspaces from assuming an
overly-privileged EC2 instance role.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `disallowed_role_arn` | Full ARN of the IAM role that must not be assumed |

### `allow-aws-regions`

Checks that the AWS provider's `region` is one of the approved regions.
Restricts workspaces to specific geographic boundaries for compliance or
cost reasons.

**Parameters:**

| Parameter | Description |
|-----------|-------------|
| `allowed_aws_regions` | List of permitted AWS region strings |

Default: `["ap-southeast-2", "us-east-1", "eu-west-1"]`

## Introduction

Terraform Cloud/Enterprise provides a governed IaC pipeline for teams.
Each workspace represents a pipeline — a VCS pull request triggers a
`terraform plan`, followed by a Sentinel policy check. This policy set
provides operational and security guardrails for how TFC/TFE itself is
configured via Terraform using the
[TFE provider](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs).
