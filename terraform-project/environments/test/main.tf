provider "azurerm" {
  features {}
}

# Разворачиваем TEST APP сервер в Швейцарии
module "app_node" {
  source                = "../../modules/networking"
  resource_group_name   = "rg-test-ia-app"
  location              = "switzerlandnorth"
  vm_name               = "app"
  vnet_address_space    = ["10.1.0.0/16"]
  subnet_address_prefix = ["10.1.1.0/24"]
  admin_password        = var.admin_password
  vm_size               = var.vm_size
  vm_image              = var.vm_image
  allowed_ports         = [
    { name = "Allow-SSH", port = "22" },
    { name = "Allow-HTTP", port = "80" }
  ]
}

module "db_node" {
  source                = "../../modules/networking"
  resource_group_name   = "rg-test-ia-db"
  location              = "norwayeast"
  vm_name               = "db"
  vnet_address_space    = ["10.2.0.0/16"]
  subnet_address_prefix = ["10.2.1.0/24"]
  admin_password        = var.admin_password
  vm_size               = var.vm_size
  vm_image              = var.vm_image
  allowed_ports         = [
    { name = "Allow-SSH", port = "22" },
    { name = "Allow-Database", port = "5432" }
  ]
}

output "app_server_public_ip" {
  value       = module.app_node.public_ip
  description = "Public IP of the TEST Application server"
}

output "db_server_public_ip" {
  value       = module.db_node.public_ip
  description = "Public IP of the TEST Database server"
}
