data "proxmox_version" "current" {}

resource "proxmox_virtual_environment_vm" "lab_baseline_01" {
  # https://bpg.sh/docs/resources/virtual_environment_vm/
  
  vm_id = 11010 # Optional. Unique identifier of the VM in the Proxmox cluster (Pattern: x.x.110.10)
  node_name = "pve" # Required. The name of the node to assign the VM to (Datacenter/pve).

  name = "lab-baseline-01" # Optional. The name of the VM.
  
  clone {
    vm_id = 9000 # debian13-template
    full = true # Default. Copies the template's disk vs. 'linked' that uses the template's disk.
  }

  agent {
    enabled = false # Qemu guest agent is not installed in the template.
  }

  stop_on_destroy = true # Forces the VM to stop instead of shutdown when using 'terraform destroy'.

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048 # Ceiling: max memory for the VM.
    floating = 2048 # Floor: guaranteed minimum (balloon). 
  }

  disk {
    datastore_id = "local-lvm"
    interface = "scsi0"
    size = 10 # Resize to 10 GiB
  }

  network_device {
    bridge = "vmbr1"
    vlan_id = 110
  }

  initialization { # cloud-init
    datastore_id = "local-lvm"

    ip_config {
      ipv4 {
        address = var.vm_ipv4_address # 10.1.110.x
        gateway = var.vm_ipv4_gateway # 10.1.110.1
      }
    }

    user_account {
      username = "ansible"
      keys = [ var.ssh_public_key ]
    }

  }



}
