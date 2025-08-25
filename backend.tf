terraform {
  backend "s3" {}
}



# terraform {
#   backend "s3" {
#     bucket = "bucket-20250721-2257"
#     key = "common/terraform.tfstate"
#     region = var.region
#     endpoints = "https://${var.bucket_namespace}.compat.objectstorage.${var.region}.oraclecloud.com"
#     namespace = var.bucket_namespace
#     skip_credentials_validation = true
#     skip_region_validation = true
#     force_path_style = true

#   }
# }

# terraform {
#   backend "oci" {
#     # Required
#     bucket            = "oci-infra-tfstatefiles"
#     namespace         = var.bucket_namespace
#     prefix            = "common/terraform.tfstate"
#      # Optional
#     # tenancy_ocid      = "ocid1.tenancy.oc1..xxxxxxx"
#     # user_ocid         = "ocid1.user.oc1..xxxxxxxx"
#     # fingerprint       = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
#     # private_key_path  = "~/.oci/oci_api_key.pem"
#     # region            = "us-ashburn-1"
#     # key               = "path/to/my/key"
#     # workspace_key_prefix = "envs/"
#     # kms_key_id        = "ocid1.key.oc1.iad.xxxxxxxxxxxxxx"
#     # auth              = "APIKey"
#     # config_file_profile = "DEFAULT"
#   }
# }

# terraform {
#   backend "s3" {
#     bucket                      = "oci-infra-tfstatefiles"
#     key                         = "common/terraform.tfstate"
#     region                      = "ap-mumbai-1"
#     endpoint                    = "https://bmjwoxtl4l4h.compat.objectstorage.ap-mumbai-1.oraclecloud.com"

#     skip_credentials_validation = true
#     skip_region_validation      = true
#     skip_metadata_api_check     = true
#     force_path_style            = true
#     skip_requesting_account_id  = true
#   }
# }
