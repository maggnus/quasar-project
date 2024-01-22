terraform {
  backend "s3" {
    bucket  = "s3-tfstate-quasar"
    key     = "test/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = false
  }

  required_version = "~> 1.6"
}
