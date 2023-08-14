terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

locals {
  condition = true
}

// resource "null_resource" "sub_a" {}

moved {
  from = null_resource.sub_a
  to   = null_resource.sub_b
}

// resource "null_resource" "sub_b" {}

moved {
  from = null_resource.sub_b
  to   = null_resource.sub_b[0]
}

# resource "null_resource" "sub_b" {
#   count = local.condition ? 1 : 0
# }

moved {
  from = null_resource.sub_b[0]
  to   = module.sub_null_resource.null_resource.sub_sub_c
}

module "sub_null_resource" {
  source = "./sub_null_resource"
}