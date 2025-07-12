
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "blog_server" {
  name   = "blog-server"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-22-04-x64"

  ssh_keys = [var.ssh_fingerprint]
}

resource "digitalocean_floating_ip" "blog_ip" {
  region = "nyc3"
}

resource "digitalocean_floating_ip_assignment" "assign_ip" {
  droplet_id  = digitalocean_droplet.blog_server.id
  ip_address  = digitalocean_floating_ip.blog_ip.ip_address
}
