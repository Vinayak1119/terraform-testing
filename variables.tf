variable "environment" {
  description = "The environment for which the compartment is being created (e.g., dev, prod)."
  type        = string
}

variable "project_name" {
  description = "The name of the project to which the compartment belongs."
  type        = string
}

variable "compartment_id" {
  description = "The OCID of the compartment where the resources will be created."
  type        = string
  default     = null
}

variable "compartment_description" {
  description = "A description for the compartment."
  type        = string
  default     = "Default compartment description"
}

variable "compartment_name" {
  description = "The name of the compartment."
  type        = string
  default     = "DefaultCompartmentName"
}

variable "instance_names" {
  description = "List of instance names to create."
  type        = list(string)
}


variable "availability_domain" {
  description = "The availability domain in which to create the instances."
  type        = string
}

variable "shape" {
  description = "The shape of the instance."
  type        = string
}

# variable "user_data" {
#   description = "User data script to run on instance creation."
#   type        = string
# }


variable "ssh_public_key_path" {
  description = "The path to the SSH public key file for instance access."
  type        = string
}

variable "vcn_cidr_blocks" {
  description = "The CIDR blocks for the VCN."
  type        = list(string)
}

variable "vcn_display_name" {
  description = "The display name for the VCN."
  type        = string
}

variable "vcn_dns_label" {
  description = "The DNS label for the VCN."
  type        = string
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type        = string
}

variable "subnet_dns_label" {
  description = "The DNS label for the public subnet."
  type        = string
}


variable "namespace" {
    description = "The namespace for the Object Storage service."
    type        = string
}

variable "bucket_name" {
  description = "The name of the Object Storage bucket."
  type        = string
}

