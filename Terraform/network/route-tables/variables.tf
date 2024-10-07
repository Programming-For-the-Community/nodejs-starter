variable "nodejs_starter_frontend_route_table" {
    description = "Route Table for the nodejs_starter_frontend application"
    type = object({
        vpc_id = string
        subnet_ids = list(string)
        gateway_id = string
        cidr_block = string
        tags = map(string) 
    })
}