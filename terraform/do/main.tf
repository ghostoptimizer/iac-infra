resource "digitalocean_droplet" "web" {
  name   = "blog-server"
  image  = "ubuntu-22-04-x64"
  size   = "s-1vcpu-1gb"
  region = "nyc3"

  ssh_keys = [var.ssh_fingerprint]

  tags = ["static-blog"]

  user_data = file("${path.module}/init.sh") # optional: for cloud-init script
}

output "vps_ip" {
  value = digitalocean_droplet.web.ipv4_address
}
