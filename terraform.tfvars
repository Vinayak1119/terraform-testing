#---------------------------------------------------
# General Variables
#---------------------------------------------------

# Paste essential variables here when running it locally




#---------------------------------------------------
# Compartment Variables
#---------------------------------------------------
environment             = "dev"
project_name            = "sreoncall"
compartment_description = "Compartment for SREONCALL project in dev environment"
compartment_name        = "compartment"

#---------------------------------------------------
# VCN Variables
#---------------------------------------------------
vcn_display_name  = "vcn"
vcn_cidr_blocks   = ["172.31.0.0/16"]
vcn_dns_label     = "vcn"
subnet_cidr_block = "172.31.0.0/24"
subnet_dns_label  = "publicsubnet"
#---------------------------------------------------
# VM Variables
#---------------------------------------------------
availability_domain = "PnKa:AP-MUMBAI-1-AD-1"
instance_names      = ["sreoncall"]
shape               = "VM.Standard.A1.Flex"
ssh_public_key_path  = "/home/runner/.ssh/oci_ubuntu_key.pub" # for GitHub Actions
# ssh_public_key_path = "/Applications/Alyssum/oci-infra/oci-infra/SREONCALL/dev/resources/vm/sre-ops.pub" #for local testing

#---------------------------------------------------
# Static Bucket Variables
#---------------------------------------------------

bucket_name   = "sreoncall-static-webapp-bucket"