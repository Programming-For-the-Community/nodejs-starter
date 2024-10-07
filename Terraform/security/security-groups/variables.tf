variable "nodejs_starter_frontend_ecs_sg" {
    description = "NodeJS Starter Front-End ECS Security Group"
    type = object({
        name_prefix = string
        vpc_id = string
        ingress = object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = list(string)
        })
        egress = object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = list(string)
        })
        tags = map(string)
    })
}

variable "nodejs_starter_frontend_elb_sg" {
    description = "NodeJS Starter Front-End ELB Security Group"
    type = object({
        name_prefix = string
        vpc_id = string
        ingress = object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = list(string)
        })
        egress = object({
            from_port = number
            to_port = number
            protocol = string
            cidr_blocks = list(string)
        })
        tags = map(string)
    })
}