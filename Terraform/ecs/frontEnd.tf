resource "aws_ecs_cluster" "nodejs_starter_frontend_cluster" {
    name = var.nodejs_starter_frontend_ecs_cluster.name
    tags = var.nodejs_starter_frontend_ecs_cluster.tags
}

resource "aws_ecs_task_definition" "nodejs_starter_frontend_task_definition" {
    family = var.nodejs_starter_frontend_ecs_task_definition.family
    execution_role_arn = var.nodejs_starter_frontend_ecs_task_definition.execution_role_arn
    task_role_arn = var.nodejs_starter_frontend_ecs_task_definition.execution_role_arn
    container_definitions = jsonencode([
        {
            name = var.nodejs_starter_frontend_ecs_task_definition.container_name
            image = var.nodejs_starter_frontend_ecs_task_definition.image
            portMappings = var.nodejs_starter_frontend_ecs_task_definition.port_mappings
            # logConfiguration = var.nodejs_starter_frontend_ecs_task_definition.logConfiguration
            # ulimits = var.nodejs_starter_frontend_ecs_task_definition.ulimits
            # environment = var.nodejs_starter_frontend_ecs_task_definition.environment
            # secrets = var.nodejs_starter_frontend_ecs_task_definition.secrets
            # command = var.nodejs_starter_frontend_ecs_task_definition.command
        }
    ])

    cpu = var.nodejs_starter_frontend_ecs_task_definition.cpu
    memory = var.nodejs_starter_frontend_ecs_task_definition.memory
    network_mode = var.nodejs_starter_frontend_ecs_task_definition.network_mode
    requires_compatibilities = var.nodejs_starter_frontend_ecs_task_definition.requires_compatibilities
    
    tags = var.nodejs_starter_frontend_ecs_task_definition.tags
}

resource "aws_ecs_service" "nodejs_starter_frontend_service" {
    name = var.nodejs_starter_frontend_ecs_service.name
    cluster = aws_ecs_cluster.nodejs_starter_frontend_cluster.id
    task_definition = aws_ecs_task_definition.nodejs_starter_frontend_task_definition.arn
    desired_count = var.nodejs_starter_frontend_ecs_service.desired_count
    launch_type = var.nodejs_starter_frontend_ecs_service.launch_type

    network_configuration {
        subnets = var.nodejs_starter_frontend_ecs_service.network_configuration.subnets
        security_groups = var.nodejs_starter_frontend_ecs_service.network_configuration.security_groups
        assign_public_ip = var.nodejs_starter_frontend_ecs_service.network_configuration.assign_public_ip
    }

    load_balancer {
        target_group_arn = var.nodejs_starter_frontend_ecs_service.load_balancer.target_group_arn
        container_name = var.nodejs_starter_frontend_ecs_service.load_balancer.container_name
        container_port = var.nodejs_starter_frontend_ecs_service.load_balancer.container_port
    }

    # service_registries {
    #     registry_arn = aws_service_discovery_service.nodejs_starter_frontend_service.arn
    #     container_name = var.nodejs_starter_frontend_ecs_service.load_balancer.container_name
    #     # container_port = var.nodejs_starter_frontend_ecs_service.load_balancer.container_port
    # }

    # service_connect_configuration {
    #     enabled = true
    #     aws_service_discovery_http_namespace.nodejs_starter_frontend_namespace.id
    # }

    # service {
    #     discovery_name = "nodejs_starter_frontend-web-app"
    # }

    # client_alias {
    #     dns_name = "nodejs_starter_frontend-web-app.com"
    #     port = var.nodejs_starter_frontend_ecs_service.load_balancer.container_port
    # }
    tags = var.nodejs_starter_frontend_ecs_service.tags
}

# resource "aws_service_discovery_public_dns_namespace" "nodejs_starter_frontend_namespace" {
#     name = "nodejs_starter_frontend-web-app.com"
#     description = "The namespace for the nodejs_starter_frontend web application"
#     # vpc = var.nodejs_starter_frontend_ecs_task_definition.vpc
# }

# resource "aws_service_discovery_http_namespace" "nodejs_starter_frontend_namespace" {
#     name = "nodejs_starter_frontend-web-app.com"
#     description = "The namespace for the nodejs_starter_frontend web application"
#     # vpc = var.nodejs_starter_frontend_ecs_task_definition.vpc
# }

# resource "aws_service_discovery_service" "nodejs_starter_frontend_service" {
#     name = "nodejs_starter_frontend-namespace"
#     dns_config {
#         namespace_id = aws_service_discovery_public_dns_namespace.nodejs_starter_frontend_namespace.id

#         dns_records {
#             ttl = 10
#             type = "A"
#         }

#     }

#     depends_on = [
#         aws_service_discovery_public_dns_namespace.nodejs_starter_frontend_namespace
#     ]
# }