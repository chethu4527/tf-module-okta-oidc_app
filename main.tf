# Some examples of things that go into this main.tf file. You will want to remove or rename these values when
# creating your own module

#example of how to declare local values

terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.40"
    }
  }
}

locals {
  nameid_format = "urn:oasis:names:tc:SAML:1.1:nameid-format:"
  oktaapp       = "O-OKTASSO-"
}

resource "okta_app_oauth" "OKTA_OIDC" {
  label                     = var.appname
  type                      = var.type
  login_uri                 = var.login_uri
  post_logout_redirect_uris = var.post_logout_redirect_uris
  redirect_uris             = var.redirect_uris
  grant_types               = var.grant_types
  response_types            = var.response_types

}


resource "okta_group" "OKTA_OAUTH_APP_GROUP" {
  count       =  var.assignment_group==null ? 1 : 0
  name        = "${local.oktaapp}${okta_app_oauth.OKTA_OIDC.label}"
  description = "This group is Created for OKTA SSO application ${okta_app_oauth.OKTA_OIDC.label}"
}

 data "okta_groups" "OKTA_OAUTH_FINDGROUP" {
    count = var.assignment_group!=null ? 1 : 0  
    q = var.assignment_group
} 


resource "okta_app_group_assignment" "OKTA_OAUTH_APP_GROUP_ASSIGNMENT" {
  app_id   = okta_app_oauth.OKTA_OIDC.id
  group_id = var.assignment_group!=null?data.okta_groups.OKTA_OAUTH_FINDGROUP[0].groups[0].id:okta_group.OKTA_OAUTH_APP_GROUP[0].id
}


resource "okta_trusted_origin" "OKTA_OAUTH_CORS" {
  name   = var.trusted_orgin_name
  origin = var.trusted_orgin_url
  scopes = ["CORS", "REDIRECT"]
}
