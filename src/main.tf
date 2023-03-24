terraform {
  backend "s3" {
    bucket = "adastra-tsg-ghactions-tf"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}