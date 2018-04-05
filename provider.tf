provider "aws" {
  region      = "${var.region}"
  max_retries = 20
}

terraform {
  required_version = "0.11.5"

  backend "s3" {
    bucket = "mcd-tfstates"
    key    = "maztest"
    region = "us-east-1"
  }
}
