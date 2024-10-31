variable "do_token" {
  description = "DigitalOcean API Token"
  type        = string
  sensitive   = true
}

variable "droplet_name" {
  description = "The name of the DigitalOcean droplet"
  type        = string
  default     = "my-droplet"
}

variable "region" {
  description = "The region where the droplet will be created"
  type        = string
  default     = "nyc3"
}

variable "droplet_size" {
  description = "The size of the droplet"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "image" {
  description = "The image used for the droplet"
  type        = string
  default     = "ubuntu-20-04-x64"
}
