mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-aws-assumes-allowed-role.sentinel"
    }
}

param "disallowed_role_arn" {
    value = "arn:aws:iam::123456789012:role/tfe-instance-role"
}

test {
    rules = {
        main = true
    }
}
