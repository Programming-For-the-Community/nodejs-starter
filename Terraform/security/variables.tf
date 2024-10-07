variable "all_traffic" {
    description = "CIDR block for all traffic"
    type = string
    nullable = false
}

variable "vpc_id" {
    description = "VPC ID for the NodeJS Starter application"
    type = string
}

variable "vpc_cidr" {
    description = "VPC CIDR for the NodeJS Starter application"
    type = string
}

variable "resource_tags" {
    description = "Tags to apply to all resources"
    type = object({
        project = string
        owner = string
        environment = string
    })
}