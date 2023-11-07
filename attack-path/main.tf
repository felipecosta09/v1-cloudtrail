resource "random_string" "random" {
  length           = 8
  special          = false
  upper            = false
  number           = false
}

data "aws_caller_identity" "current" {}