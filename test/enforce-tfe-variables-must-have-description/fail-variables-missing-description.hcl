
mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-tfe-variable-without-description.sentinel"
    }
}

test {
    rules = {
        main = false
    }
}
