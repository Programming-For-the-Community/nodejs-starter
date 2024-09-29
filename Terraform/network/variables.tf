variable "resource_tags" {
    description = "Tags to apply to all resources"
    type = object({
        project = string
        owner = string
        environment = string
    })
}

variable "vpc_name" {
  description = "Name for the VPC"
  type = string
  nullable = false
  default = "nodejs-starter-vpc"
}

variable "region" {
  description = "AWS Region to build infrastructure in"
  type        = string
  default     = "us-east-2"
  nullable    = false
}

variable "subnet_a_cidr" {
  description = "CIDR block for nodejs-starter subnet A"
  type        = string
  nullable    = false
  default     = "10.0.1.0/28"
}

variable "subnet_b_cidr" {
  description = "CIDR block for nodejs-starter subnet B"
  type        = string
  nullable    = false
  default     = "10.0.1.16/28"
}

variable "subnet_c_cidr" {
  description = "CIDR block for nodejs-starter subnet C"
  type        = string
  nullable    = false
  default     = "10.0.1.32/28"
}