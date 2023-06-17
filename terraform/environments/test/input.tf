# Azure GUIDS
variable "subscription_id" {
  default = "c9555088-24ba-4e8d-affb-0b68b9a195e0"
}
variable "client_id" {
  default = "d6b86fe7-bc44-476c-878e-1137814d1243"
}
variable "client_secret" {
  default = "hyC8Q~n-0DURhby_nydCrt5s~RFMTQqhqqNaSboX"
}
variable "tenant_id" {
  default = "077803a8-a498-44f2-a067-4aa2d838ad37"
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


