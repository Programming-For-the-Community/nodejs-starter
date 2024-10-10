resource "aws_ecs_cluster" "nodejs_starter_frontend_cluster" {
    name = "nodejs_starter_frontend_cluster"
    tags = {
      Name        = "NodeJS Starter Front-End ECS Cluster"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
}

resource "aws_ecs_task_definition" "nodejs_starter_frontend_task_definition" {
    family = "${var.project_name}_frontend"
    execution_role_arn = aws_iam_role.nodejs_starter_frontend_ecs_role.arn
    task_role_arn = aws_iam_role.nodejs_starter_frontend_ecs_role.arn
    container_definitions = jsonencode([
        {
            name = "nodejs_starter_frontend_container"
            image = "${aws_ecr_repository.nodejs_starter_container_registry.repository_url}:${var.frontend_image}"
            portMappings = [
                {
                    containerPort = 8080
                    hostPort      = 8080
                },
                {
                    containerPort = 8443
                    hostPort      = 8443
                }
            ]

            logConfiguration = {
                logDriver = "awslogs"
                options = {
                    awslogs-group         = "nodejs-starter-frontend-ecs"
                    awslogs-region        = var.region
                    awslogs-stream-prefix = "ecs"
                }
            }

            # ulimits = [
            #     {
            #         name = "nofile"
            #         softLimit = 65536
            #         hardLimit = 65536
            #     }
            # ]

            # environment = [
            #     {
            #         name = "PORT"
            #         value = 9000
            #     }
            # ]
            # secrets = [
            #     {
            #         name = "DATABASE_URL"
            #         valueFrom = "arn:aws:ssm:us-east-1:123456789012:parameter/nodejs_starter_database_url"
            #     }
            # ]
            
            # command = ["sh /app/server/server.sh"]
        }
    ])

    cpu                      = "1024"
    memory                   = "4096"
    network_mode             = "awsvpc"
    requires_compatibilities = ["FARGATE"]
    tags = {
      Name        = "NodeJS Starter Front-End ECS Task"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
}

resource "aws_ecs_service" "nodejs_starter_frontend_service" {
    name = "nodejs_starter_frontend_service"
    cluster = aws_ecs_cluster.nodejs_starter_frontend_cluster.id
    task_definition = aws_ecs_task_definition.nodejs_starter_frontend_task_definition.arn
    desired_count = 2
    launch_type   = "FARGATE"

    network_configuration {
      subnets          = [
        aws_subnet.nodejs_starter_east2a.id,
        aws_subnet.nodejs_starter_east2b.id,
        aws_subnet.nodejs_starter_east2c.id
      ]

      security_groups  = [
        aws_security_group.nodejs_starter_frontend_ecs_sg.id
      ]
      
      assign_public_ip = true
    }

    # load_balancer = {
    #   target_group_arn = module.network.frontend_ecs_tg_id
    #   container_name   = "nodejs_starter_frontend_container"
    #   container_port   = 8080
    # }

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

    tags = {
      Name        = "NodeJS Starter Front-End ECS Service"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
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