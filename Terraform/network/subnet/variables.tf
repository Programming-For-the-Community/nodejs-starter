variable "nodejs_starter_east2a" {
    description = "Subnet for hosting the chronic application"
    type = object({
        vpc_id = string
        cidr_block = string
        availability_zone = string
        tags = map(string) 
    })
}

variable "nodejs_starter_east2b" {
    description = "Subnet for hosting the chronic application"
    type = object({
        vpc_id = string
        cidr_block = string
        availability_zone = string
        tags = map(string) 
    })
}

variable "nodejs_starter_east2c" {
    description = "Subnet for hosting the chronic application"
    type = object({
        vpc_id = string
        cidr_block = string
        availability_zone = string
        tags = map(string) 
    })
}