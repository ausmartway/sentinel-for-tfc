# sentinel-for-tfc

## TLDR

This is a policy set of Sentinel that governs Terraform Cloud/Enterprise.

## Introduction

As the most popular Infrastructure as Code tool(or one of), Terraform helps in configuring, provisioning, and managing the infrastructure accross multi-clouds. Terraform is not only just for infrastructures, it can be used as Configuration as Code to manage the configuration of many software solutions. This includes Terraform Cloud/Enterprise itslef.

Terraform Cloud/Enterprise is a secure/reliable and governed IaC pipeline that helps teams use Terraform cli all together. Each Terraform Cloud workspace can be seen as a pipeline job. A pull request from VCS trigger a terraform plan, which then triggers a policy check for security or operational compliance check. Passing all checks is good indication that the pull request is compliant.


