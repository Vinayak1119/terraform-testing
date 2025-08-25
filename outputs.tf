output "public_ip_address" {
  description = "The address of the reserved public IP."
  value       = module.static_ip.public_ip_address
}

