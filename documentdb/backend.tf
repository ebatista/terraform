# tfstate
terraform {
        backend "s3" {
                bucket = "xxxx-tfstate"
                key = "lab/docdb-test-lab.tfstate"
                region = "us-east-1"
        }
}

