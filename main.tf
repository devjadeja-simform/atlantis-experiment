terraform {
  backend "s3" {
    bucket = "atlantis-exp-tf-state"
    key    = "exp"
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


variable "num_random_numbers" {
  type    = number
  default = 1
}

resource "random_integer" "example" {
  count = var.num_random_numbers
  keepers = {
    first = "${timestamp()}"
  }
  min = 100000
  max = 999999
}

output "one_time_passcode" {
  value = random_integer.example[*].result
}
