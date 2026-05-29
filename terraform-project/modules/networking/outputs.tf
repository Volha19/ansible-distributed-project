output "public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP address of the deployed node"
}
