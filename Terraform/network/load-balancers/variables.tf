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