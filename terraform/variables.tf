variable "proxmox_endpoint" {
  description = "Proxmox URL"
  type        = string
}

variable "proxmox_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}
