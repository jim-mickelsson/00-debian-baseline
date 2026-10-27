variable "proxmox_endpoint" {
  description = "Proxmox URL"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "Public key for the ansible user. Added to VMs with cloud-init"
  type = string
}

variable "vm_ipv4_address" {
  description = "Static IPv4 address with CIDR"
  type = string
}

variable "vm_ipv4_gateway" {
  description = "IPv4 gateway"
  type = string
}
