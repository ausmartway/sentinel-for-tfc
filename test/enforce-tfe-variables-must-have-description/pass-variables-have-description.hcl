
mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-tfe-variable-with-description.sentinel"
    }
}

test {
    rules = {
        main = true
    }
}
