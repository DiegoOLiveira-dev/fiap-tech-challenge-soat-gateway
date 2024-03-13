terraform {
  backend "s3" {
    bucket = "terraform-state-fiap"
    key    = "Prod/gateway/terraform.tfstate"
    region = "us-east-1"
  }
}