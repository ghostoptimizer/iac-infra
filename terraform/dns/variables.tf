variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
  sensitive = true
}

variable "zone_id" {
  type = string
}

variable "domain_name" {
  type = string
}




