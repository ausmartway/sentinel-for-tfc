
import "module" "tfplan-functions" {
    source = "https://raw.githubusercontent.com/hashicorp/terraform-sentinel-policies/main/common-functions/tfplan-functions/tfplan-functions.sentinel"
}
  
mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-tfe-terraform-version-in-examption-list.sentinel"
    }
} 

test {
    rules = {
      main          = true
    }
}