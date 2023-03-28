# example of an output value
# https://www.terraform.io/docs/language/values/outputs.html

output "app_details" {
  description = "List of all OIDC application details"
  value       = okta_app_oauth.OKTA_OIDC.*
}
