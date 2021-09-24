module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}


module "tfconfig-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}


module "tfstate-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfstate-functions/tfstate-functions.sentinel"
}


module "tfplan-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfrun-functions" {
  source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfrun-functions/tfrun-functions.sentinel"
}

policy "allow-whitelisted-tags" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/allow-whitelisted-tags.sentinel"
    enforcement_level = "soft-mandatory"
}

policy "allow-whitelisted-vcs-providers" {
  source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/allow-whitelisted-vcs-provider.sentinel"
    enforcement_level = "soft-mandatory"
}


policy "disallow-global-remote-state" {
   source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/disallow-global-remote-state.sentinel"
 
    enforcement_level = "soft-mandatory"
}

policy "enforce-well-known-envvariables-sensitive" {
   source = "https://raw.githubusercontent.com/ausmartway/sentinel-for-tfc/enforce-well-known-envvariables-sensitive.sentinel"
 
    enforcement_level = "soft-mandatory"
}


