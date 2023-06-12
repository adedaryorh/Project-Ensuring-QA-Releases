# Azure GUIDS
variable "subscription_id" {
  default = "b36c07e6-4e1b-48b7-9e22-ba384d37833a"
}
variable "client_id" {
  default = "3c9068b9-c7b3-4518-9398-8bff15fa6500"
}
variable "client_secret" {
  default = "7ae8Q~t6-weig4nRZJGnlUVsBPY.6ymckDCQMafZ"
}
variable "tenant_id" {
  default = "d879c1a3-4270-4d76-a9b6-dcd67e3c53dc"
}

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


