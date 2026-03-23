import "module" "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}


import "module" "tfconfig-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}


import "module" "tfstate-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfstate-functions/tfstate-functions.sentinel"
}

import "module" "tfrun-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfrun-functions/tfrun-functions.sentinel"
}

policy "allow-whitelisted-tags" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/allow-whitelisted-tags.sentinel"
    enforcement_level = "advisory"
}

policy "allow-whitelisted-vcs-providers" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/allow-whitelisted-vcs-providers.sentinel"
    enforcement_level = "advisory"
}


policy "disallow-global-remote-state" {
   source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/disallow-global-remote-state.sentinel"
 
    enforcement_level = "advisory"
}

policy "enforce-well-known-envvariables-sensitive" {
   source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/enforce-well-known-envvariables-sensitive.sentinel"
 
    enforcement_level = "advisory"
}

policy "enforce-minimal-terraform-versions" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/enforce-minimal-terraform-verions.sentinel"
    enforcement_level = "advisory"
}

policy "enforce-tfe-variables-must-have-description" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/enforce-tfe-variables-must-have-description.sentinel"
    enforcement_level = "advisory"
}

policy "disallow-assuming-tfe-ec2-iam-role" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/disallow-assuming-tfe-ec2-iam-role.sentinel"
    enforcement_level = "advisory"
    params = {
      disallowed_role_arn = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
    }
}

policy "allow-aws-regions" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/main/allow-aws-regions.sentinel"
    enforcement_level = "advisory"
    params = {
      allowed_aws_regions = ["ap-southeast-2", "us-east-1", "eu-west-1"]
    }
}
