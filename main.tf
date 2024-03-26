terraform {
  backend "s3" {
    bucket = "atlantisexp-tfstate"
    key    = "atlantis/experiment/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = "= 1.7.5"
  
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}


variable "entity_count" {
  type    = number
  default = 2
}

resource "random_integer" "one_time_passcode" {
  count = var.entity_count
  keepers = {
    first = "${timestamp()}"
  }
  min = 100000
  max = 999999
}

output "one_time_passcode" {
  value = random_integer.one_time_passcode[*].id
}


resource "random_pet" "container_alias" {
  count = var.entity_count
  keepers = {
    first = "${timestamp()}"
  }
  length = 2
}

output "container_alias" {
  value = random_pet.container_alias[*].id
}