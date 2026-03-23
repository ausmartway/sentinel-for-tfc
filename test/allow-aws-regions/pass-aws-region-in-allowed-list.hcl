mock "tfplan/v2" {
    module {
        source = "../../mocks/mock-tfplan-v2-aws-region-in-allowed-list.sentinel"
    }
}

param "allowed_aws_regions" {
    value = ["ap-southeast-2", "us-east-1", "eu-west-1"]
}

test {
    rules = {
        main = true
    }
}
