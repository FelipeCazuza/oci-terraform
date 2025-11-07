terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 5.40.0"
    }
  }
  required_version = ">= 1.5.0"
}

# ===== PROVIDER =====
provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# ===== BUSCAR IMAGEM MAIS RECENTE =====
data "oci_core_images" "oracle_linux_9" {
  compartment_id           = var.compartment_id
  operating_system         = "Oracle Linux"
  operating_system_version = "9"
  shape                    = "VM.Standard.A2.Flex"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

# ===== VM BASTION - PUBLIC SUBNET =====
resource "oci_core_instance" "vm_bastion" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "vm-bastion"
  shape               = "VM.Standard.E2.1.Micro"

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_9.images[0].id
  }

  create_vnic_details {
    subnet_id        = var.public_subnet_id
    assign_public_ip = true
    hostname_label   = "bastion"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }

  freeform_tags = {
    environment = "lab"
    project     = "cloudinfra"
    role        = "bastion"
  }
}

# ===== VM GLPI - PRIVATE SUBNET =====
resource "oci_core_instance" "vm_glpi" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "vm-glpi"
  shape               = "VM.Standard.A2.Flex"

  shape_config {
    ocpus         = 0.5
    memory_in_gbs = 8
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_9.images[0].id
  }

  create_vnic_details {
    subnet_id        = var.private_subnet_id
    assign_public_ip = false
    hostname_label   = "glpi"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }

  freeform_tags = {
    environment = "lab"
    project     = "cloudinfra"
    role        = "glpi"
  }
}

# ===== VM BANCO - PRIVATE SUBNET =====
resource "oci_core_instance" "vm_banco" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_id
  display_name        = "vm-banco"
  shape               = "VM.Standard.A2.Flex"

  shape_config {
    ocpus         = 0.5
    memory_in_gbs = 8
  }

  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_9.images[0].id
  }

  create_vnic_details {
    subnet_id        = var.private_subnet_id
    assign_public_ip = false
    hostname_label   = "banco"
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_public_key_path)
  }

  freeform_tags = {
    environment = "lab"
    project     = "cloudinfra"
    role        = "banco"
  }
}
