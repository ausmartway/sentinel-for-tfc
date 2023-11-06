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
