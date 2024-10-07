variable "nodejs_starter_frontend_ecs_cluster"{
    description = "ECS Cluster for the NodeJS Starter Front-End application"
    type = object({
        name = string
        tags = map(string)
    })
}

variable "nodejs_starter_frontend_ecs_task_definition" {
    description = "ECS for the NodeJS Starter Front-End"
    type = object({
        family = string
        vpc = string
        execution_role_arn = string
        container_name = string
        image = string
        port_mappings = list(
            object({
                containerPort = number
                hostPort = number
            })
        )
        # logConfiguration = object({
        #     logDriver = string
        #     options = map(string)
        # })
        # ulimits = list(object({
        #     name = string
        #     softLimit = number
        #     hardLimit = number
        # }))
        # environment = list(object({
        #     name = string
        #     value = string
        # }))
        # secrets = list(object({
        #     name = string
        #     valueFrom = string
        # }))
        # command = list(string)
        cpu = string
        memory = string
        network_mode = string
        requires_compatibilities = list(string)
        tags = map(string)
    })
}

variable "nodejs_starter_frontend_ecs_service" {
    description = "ECS Service for the NodeJS Starter Front-End Service"
    type = object({
        name = string
        desired_count = number
        launch_type = string
        network_configuration = object({
            subnets = list(string)
            security_groups = list(string)
            assign_public_ip = bool
        })
        load_balancer = object({
            target_group_arn = string
            container_name = string
            container_port = number
        })
        tags = map(string)
    })
}