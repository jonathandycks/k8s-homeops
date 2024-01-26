terraform {
  required_providers {
    authentik = {
      source  = "goauthentik/authentik"
      version = "2023.10.0"
    }
  }
  cloud {
    organization = "dyckshaus"
    workspaces {
      name = "authentik-provisioner"
    }
  }
}
