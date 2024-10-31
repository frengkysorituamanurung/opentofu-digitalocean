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

# Add the SSH key to DigitalOcean
resource "digitalocean_ssh_key" "my_ssh_key" {
  name       = "my-ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Adjust path if necessary
}

# Resource block for creating a droplet with SSH access
resource "digitalocean_droplet" "web" {
  name              = var.droplet_name
  region            = var.region
  size              = var.size
  image             = var.image
  ipv6              = true
  backups           = true
  monitoring        = true

  ssh_keys          = [digitalocean_ssh_key.my_ssh_key.id]  # Reference the SSH key here
  tags              = ["web", "terraform"]
}

# Output the droplet IP address
output "droplet_ip" {
  value = digitalocean_droplet.web.ipv4_address
}
