# ==========================================
# 1. PROVIDER CONFIGURATION (Azure)
# ==========================================
provider "azurerm" {
  features {}
}

# ==========================================
# 2. RESOURCE GROUPS (One per Region)
# ==========================================

# Resource Group in Switzerland
resource "azurerm_resource_group" "rg_app" {
  name     = "rg-ia-terraform-app"
  location = "switzerlandnorth"
}

# Resource Group in Norway
resource "azurerm_resource_group" "rg_db" {
  name     = "rg-ia-terraform-db"
  location = "norwayeast"
}

# ==========================================
# 3. SWITZERLAND INFRASTRUCTURE (APP SERVER)
# ==========================================

# Network for App
resource "azurerm_virtual_network" "vnet_app" {
  name                = "app-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
}

resource "azurerm_subnet" "subnet_app" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.rg_app.name
  virtual_network_name = azurerm_virtual_network.vnet_app.name
  address_prefixes     = ["10.1.1.0/24"]
}

# Security for App (SSH & HTTP)
resource "azurerm_network_security_group" "nsg_app" {
  name                = "app-nsg"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# App Public IP & NIC
resource "azurerm_public_ip" "app_ip" {
  name                = "ansible-app-ip"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "app_nic" {
  name                = "ansible-app-nic"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "app_assoc" {
  network_interface_id      = azurerm_network_interface.app_nic.id
  network_security_group_id = azurerm_network_security_group.nsg_app.id
}

# App VM (Switzerland)
resource "azurerm_linux_virtual_machine" "app_vm" {
  name                            = "ansible-vm-app"
  resource_group_name             = azurerm_resource_group.rg_app.name
  location                        = azurerm_resource_group.rg_app.location
  size                            = "Standard_B2ats_v2"
  admin_username                  = "Hryshkevich"
  admin_password                  = "Hryshkevich123!"
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.app_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-gen2"
    version   = "latest"
  }
}

# ==========================================
# 4. NORWAY INFRASTRUCTURE (DB SERVER)
# ==========================================

# Network for DB
resource "azurerm_virtual_network" "vnet_db" {
  name                = "db-vnet"
  address_space       = ["10.2.0.0/16"]
  location            = azurerm_resource_group.rg_db.location
  resource_group_name = azurerm_resource_group.rg_db.name
}

resource "azurerm_subnet" "subnet_db" {
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.rg_db.name
  virtual_network_name = azurerm_virtual_network.vnet_db.name
  address_prefixes     = ["10.2.1.0/24"]
}

# Security for DB (SSH & PostgreSQL)
resource "azurerm_network_security_group" "nsg_db" {
  name                = "db-nsg"
  location            = azurerm_resource_group.rg_db.location
  resource_group_name = azurerm_resource_group.rg_db.name

  security_rule {
    name                       = "Allow-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Database"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432" 
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# DB Public IP & NIC
resource "azurerm_public_ip" "db_ip" {
  name                = "ansible-db-ip"
  location            = azurerm_resource_group.rg_db.location
  resource_group_name = azurerm_resource_group.rg_db.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "db_nic" {
  name                = "ansible-db-nic"
  location            = azurerm_resource_group.rg_db.location
  resource_group_name = azurerm_resource_group.rg_db.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_db.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.db_ip.id
  }
}

resource "azurerm_network_interface_security_group_association" "db_assoc" {
  network_interface_id      = azurerm_network_interface.db_nic.id
  network_security_group_id = azurerm_network_security_group.nsg_db.id
}

# DB VM (Norway East)
resource "azurerm_linux_virtual_machine" "db_vm" {
  name                            = "ansible-vm-db"
  resource_group_name             = azurerm_resource_group.rg_db.name
  location                        = azurerm_resource_group.rg_db.location
  size                            = "Standard_B2ats_v2"
  admin_username                  = "Hryshkevich"
  admin_password                  = "Hryshkevich123!"
  disable_password_authentication = false

  network_interface_ids = [azurerm_network_interface.db_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-gen2"
    version   = "latest"
  }
}

# ==========================================
# 5. OUTPUTS (Display public IP addresses)
# ==========================================
output "app_server_public_ip" {
  value       = azurerm_public_ip.app_ip.ip_address
  description = "Public IP of the Application server"
}

output "db_server_public_ip" {
  value       = azurerm_public_ip.db_ip.ip_address
  description = "Public IP of the Database server"
}
