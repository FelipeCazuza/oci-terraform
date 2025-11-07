# ===== OUTPUTS =====
# Exibe os endereços IP das instâncias após a criação.

output "bastion_public_ip" {
  description = "Endereço IP público da VM Bastion"
  value       = oci_core_instance.vm_bastion.public_ip
  sensitive   = true
}

output "banco_private_ip" {
  description = "Endereço IP privado da VM Banco"
  value       = oci_core_instance.vm_banco.private_ip
  sensitive   = true
}

output "glpi_private_ip" {
  description = "Endereço IP privado da VM GLPI"
  value       = oci_core_instance.vm_glpi.private_ip
  sensitive   = true
}
