module "compartment" {
  source                  = "../resources/compartment"
  tenancy_ocid            = var.tenancy_ocid
  user_ocid               = var.user_ocid
  fingerprint             = var.fingerprint
  private_key_path        = file(var.private_key_path)
  region                  = var.region
  private_key_password    = var.private_key_password
  environment             = var.environment
  compartment_description = var.compartment_description
  compartment_name        = var.compartment_name
  project_name            = var.project_name
}

module "vcn" {
  source            = "../resources/vcn"
  environment       = var.environment
  project_name      = var.project_name
  compartment_id    = module.compartment.compartment_id
  vcn_cidr_blocks   = var.vcn_cidr_blocks
  vcn_display_name  = var.vcn_display_name
  vcn_dns_label     = var.vcn_dns_label
  subnet_cidr_block = var.subnet_cidr_block
  subnet_dns_label  = var.subnet_dns_label
}

module "vm_instance" {
  source              = "../resources/vm"
  environment         = var.environment
  compartment_id      = module.compartment.compartment_id
  availability_domain = var.availability_domain
  instance_names      = var.instance_names
  shape               = var.shape
  subnet_id           = module.vcn.subnet_id
  ssh_public_key_path = var.ssh_public_key_path
  user_data           = file("${path.module}/initial-setup.sh")
}

data "oci_core_private_ips" "vm_private_ip_search" {
  ip_address = module.vm_instance.primary_private_ip_address[0]
  subnet_id  = module.vcn.subnet_id
}

module "static_ip" {
  source         = "../resources/static_ip"
  environment    = var.environment
  project_name   = var.project_name
  compartment_id = module.compartment.compartment_id
  private_ip_id  = data.oci_core_private_ips.vm_private_ip_search.private_ips[0].id
  depends_on     = [module.vm_instance]
}

module "static_website_bucket" {
  source         = "../resources/bucket"
  compartment_id = module.compartment.compartment_id
  namespace      = var.namespace
  bucket_name    = var.bucket_name
  environment    = var.environment
}
