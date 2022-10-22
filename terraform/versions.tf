terraform {
  backend "s3" {
    key    = "datadog/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    datadog = {
      source = "DataDog/datadog"
    }
  }
}
