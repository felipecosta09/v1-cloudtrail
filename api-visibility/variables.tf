# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
  default     = "v1-api-visibility"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "production"
}

variable "cost-center" {
  description = "Cost Center"
  type        = string
  default     = "adm-logistics"
}
