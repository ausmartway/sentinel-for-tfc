module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}


module "tfconfig-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}


module "tfstate-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfrun-functions" {
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


