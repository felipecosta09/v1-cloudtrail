# provider variable
variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "us-east-1"
}

variable "prefix" {
  description = "Prefix for the resources"
  type        = string
  default     = "v1-attack-path"
}

variable "key-pair" {
  description = "Key pair name"
  type        = string
  default     = "felipe"
}