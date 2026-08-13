terraform {
  required_version = ">= 1.15, < 2.0"
}

locals {
  greeting = "Hello, ${var.learner_name}!"
}

resource "terraform_data" "lesson" {
  input = {
    greeting = local.greeting
    topic    = "Terraform basics"
  }
}
