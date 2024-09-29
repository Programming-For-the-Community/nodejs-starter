variable "resource_tags" {
  description = "Tags to apply to all resources"
  type = object({
    project     = string
    owner       = string
    environment = string
  })

  default = {
    project     = "NodeJS Starter Environment"
    owner       = "Charlie Hahm"
    environment = "development"
  }
}

variable "region" {
  description = "AWS Region to build infrastructure in"
  type        = string
  default     = "us-east-2"
  nullable    = false
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  nullable    = false
  default     = "nodejs-starter-env"
}

variable "vpc_id" {
  description = "ID for professorchaos0802_vpc"
  type        = string
  nullable    = false
  default     = "vpc-professorchaos0802"
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