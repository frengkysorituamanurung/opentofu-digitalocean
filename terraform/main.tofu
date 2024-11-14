resource "digitalocean_droplet" "app_droplet" {
  name   = var.droplet_name
  region = var.region
  size   = var.droplet_size
  image  = var.image

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      host        = digitalocean_droplet.app_droplet.ipv4_address
      private_key = file("~/.ssh/id_rsa")
      timeout     = "5m"
      insecure    = true
    }

    script = "${path.module}/droplet_provision.sh" # This script installs Docker
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.app_droplet.ipv4_address
}
