terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

module "calculator" {
  source = "../../modules/cost-calculator"

  instances = var.instances
}

variable "instances" {}
