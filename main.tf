terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
    }
  }
}

# resource "null_resource" "a" {}

moved {
  from = null_resource.a
  to   = module.null_resource.null_resource.sub_a
}

module "null_resource" {
  source = "./module"
}