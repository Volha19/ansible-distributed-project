variable "student_id" {
  type        = string
  description = "The student ID number (X)"
}

variable "first_name_letter" {
  type        = string
  description = "The first letter of the first name (Y)"
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type = string
}

variable "vm_image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}
