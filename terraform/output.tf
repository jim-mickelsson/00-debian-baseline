output "data_proxmox_version" {
    description = "Proxmox release, confirms the API connection works"
    value = {
        release = data.proxmox_version.current.release
        version = data.proxmox_version.current.version
    }
}
