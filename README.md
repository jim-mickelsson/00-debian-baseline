# Debian IaC Hardening Baseline

Builds a Debian VM on Proxmox with Terraform. Hardening with Ansible is planned.

## What it does

Terraform clones a Debian 13 cloud image template into a VM. Cloud-init sets a static IPv4 address and creates a user named `ansible` with an SSH key and no password.

## Purpose

A learning project: building infrastructure as code step by step in a segmented home lab.
