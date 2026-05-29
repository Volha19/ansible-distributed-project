variable "resource_group_name" {
  type        = string
  description = "Name of the resource group passed from the root environment"
}

variable "location" {
  type        = string
  description = "Azure resource deployment region"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for Virtual Network"
}

variable "subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for Subnet"
}

variable "allowed_ports" {
  type = list(object({
    name = string
    port = string
  }))
  description = "List of ports to open in Network Security Group"
}

variable "admin_username" {
  type    = string
  default = "Hryshkevich"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type        = string
  description = "Size of the Virtual Machine"
  default = "Standard_B2s"
}

variable "vm_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "Operating system image parameters"
}
