terraform {
  required_providers {
    digitalocean = {
      source  = "opentofu/digitalocean"
      version = "2.40.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}