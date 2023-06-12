
# Resource Group/Location

variable "location" {
  default = "eastus"
}
variable "resource_group" {
  default = "ensuring-qa-release-rg"
}
variable "webapp_name" {
  default = "qa-monitoring"
}

variable "application_type" {
  default = "ev-eastus-001"
}

# Network
variable "virtual_network_name" {
  default = "qa-virtual-net"
}
variable "address_prefix_test" {
  default = ["10.0.2.0/24"]
}
variable "address_space" {
  default = ["10.5.0.0/16"]
}

# Virtual Machine
variable "vm_admin_username" {
  default = "adedaryorh"
}
variable "vm_public_key" {}

# Tags
variable "project" {}
