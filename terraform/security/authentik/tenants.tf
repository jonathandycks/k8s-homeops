data "authentik_tenant" "authentik-default" {
  domain = "authentik-default"
}

resource "authentik_tenant" "dyckshaus" {
  domain              = var.external_domain
  default             = false
  branding_title      = "Dyckshaus"
  flow_authentication = authentik_flow.dyckshaus-authentication.uuid
  flow_invalidation   = data.authentik_flow.default-invalidation-flow.id
  flow_user_settings  = data.authentik_flow.default-user-settings-flow.id
  branding_logo       = "/media/branding/dyckshaus-logo.svg"
  branding_favicon    = "/media/branding/dyckshaus-favicon.png"
}
