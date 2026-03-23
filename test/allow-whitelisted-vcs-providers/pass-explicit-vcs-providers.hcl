
module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}
  
mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-tfe-oauth-client-in-the-list.sentinel"
    }
} 

test {
    rules = {
      main          = true
    }
}