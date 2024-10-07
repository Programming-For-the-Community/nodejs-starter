variable "nodejs_starter_frontend_lb" {
    description = "Load Balancer for the ECS hosting the NodeJS Starter Front-End"
    type = object({
        name = string
        internal = bool
        load_balancer_type = string
        security_groups = list(string)
        subnets = list(string)
        tags = map(string)
    })
}

variable "nodejs_starter_frontend_lb_tg" {
    description = "Target Group for the ECS hosting the NodeJS Starter Front-End"
    type = object({
        name = string
        port = number
        protocol = string
        target_type = string
        vpc_id = string
        health_check = object({
            enabled = bool
            healthy_threshold = number
            unhealthy_threshold = number
            interval = number
            protocol = string
            matcher = string
            timeout = number
        })
        tags = map(string)
    })
}

variable "nodejs_starter_frontend_lb_listener" {
    description = "Listener for the ECS hosting the NodeJS Starter Front-End"
    type = object({
        port = number
        protocol = string
        default_action_type = string
        tags = map(string)
    })
}