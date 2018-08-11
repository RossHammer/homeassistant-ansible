provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "rosshammer"
    key    = "homeassistant.tfstate"
    region = "us-east-1"
  }
}
