# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-2"
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
  default     = "v1-attack-path"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "cost-center" {
  description = "Cost center"
  type        = string
  default     = "adm-logistics"
}