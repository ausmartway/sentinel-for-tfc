
module "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-guides/master/governance/third-generation/common-functions/tfplan-functions/tfplan-functions.sentinel"
}
  
mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-tfe-workspace-tags-in-allowed-list.sentinel"
    }
} 

test {
    rules = {
      main          = true
    }
}