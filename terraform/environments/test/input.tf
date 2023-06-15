# Azure GUIDS
variable "subscription_id" {
  default = "b36c07e6-4e1b-48b7-9e22-ba384d37833a"
}
variable "client_id" {
  default = "6f44cc95-d3d9-4180-a2d1-84402c5cded4"
}
variable "client_secret" {
  default = "cPW8Q~Qh0OkLY3zQLlWSmyhDLD2QUwdjcZAssbt_"
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

variable "application_type" {}

# Network
variable "virtual_network_name" {}
variable "address_prefix_test" {}
variable "address_space" {}

# Virtual Machine
variable "vm_admin_username" {
  default = "adedaryorh"
}
variable "vm_public_key" {}

# Tags
variable "project" {}


