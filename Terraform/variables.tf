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

variable "account_id" {
  description = "AWS Account ID"
  type        = string
  nullable    = false
  default = "1234567890"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  nullable    = false
  default     = "nodejs-starter-env"
}

variable "all_traffic" {
  description = "CIDR block for all traffic"
  type        = string
  default     = "0.0.0.0/0"
  nullable    = false
}

variable "vpc_cidr" {
  description = "CIDR block for professorchaos0802_vpc"
  type        = string
  nullable    = false
  default     = "194.75.0.0/16"
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

variable "frontend_image" {
  description = "Docker image for the frontend"
  type        = string
  default     = "nodejs-starter-frontend"
}