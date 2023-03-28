/* 
    These are the variables that you are going to use as inputs to the module. They will go
    inside the module stanza declaration. Some common types include string, number and bool. You can also
    create lists of these types like list(string). See https://www.terraform.io/docs/language/values/variables.html for
    the complete documentation around valid variable declaration 
*/
variable "api_token_value" {
  default = "XXX"

}

variable "appname" {
  description = "Application name for okta SSO Configuration"
  type        = string
  default     = null
}



variable "type" {
  description = "application SSO Type"
  type        = string
  validation {
    condition     = contains(["SAML", "OIDC", "web"], var.type)
    error_message = "Allowed values for SSO Federation are \"SAML\", \"OIDC\"."
  }
  default = "web"
}

variable "login_uri" {
  description = "OIDC Application Login URL"
  type        = string
  default     = null
}

variable "post_logout_redirect_uris" {
  description = "OIDC Application logout URL"
  type        = list(string)
  default     = []
}

variable "redirect_uris" {
  description = "OIDC Application redirect URL"
  type        = list(string)
  default     = []
}

variable "grant_types" {
  description = "OIDC Application Grant Types"
  type        = list(string)
  /* validation {
    condition     = contains(["authorization_code", "client_credentials","implicit"], var.grant_types)
    error_message = "Allowed values for SSO grant_types are \"authorization_code\", \"client_credentials\"."
  } */
  default = null
}

variable "response_types" {
  description = "OIDC Application response Types"
  type        = list(string)
  /* validation {
    condition     = contains(["code", "token","id_token"], var.response_types)
    error_message = "Allowed values for SSO response_types are \"code\", \"token\",\"id_token\"."
  }  */
  default = null
}

variable "trusted_orgin_name" {
  description = "Trusted Orgin Name"
  type        = string
  default     = null
}

variable "trusted_orgin_url" {
  description = "Trusted Orgin URL"
  type        = string
  default     = null
}

variable "business_type" {
  description = "Business type of OKTA tenant[B2E,B2B or B2C]"
  type        = string
  default     = null
}

variable "assignment_group" {
  description = "AD Assignment Group"
  type        = string
  default     = null
}