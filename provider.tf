terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "7.10.0"
    }
  }
}

provider "oci" {
  tenancy_ocid         = var.tenancy_ocid
  user_ocid            = var.user_ocid
  fingerprint          = var.fingerprint
  private_key          = file(var.private_key_path)
  region               = var.region
  private_key_password = var.private_key_password
}

variable "tenancy_ocid" {
  description = "The OCID of the tenancy where the compartment will be created."
  type        = string

}

variable "user_ocid" {
  description = "The OCID of the user who will manage the compartment."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the user's API key."
  type        = string
}

variable "private_key_path" {
  description = "The file path to the user's private key."
  type        = string
}

variable "region" {
  description = "The OCI region where the compartment will be created."
  type        = string
}

variable "private_key_password" {
  description = "The password for the private key, if applicable."
  type        = string
  default     = null
}