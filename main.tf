terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  backend "s3" {
    bucket = "nodejs-starter-tfstate-048908104884"
    region = "us-east-2"
    key    = "nodejs-starter.tfstate"
  }

}

provider "aws" {
  profile = "default"
  region  = var.region
}

module "network" {
  source                          = "./Terraform/network"
  resource_tags                   = var.resource_tags
  vpc_id                          = var.vpc_id
  all_traffic                     = var.all_traffic
  subnet_a_cidr                   = var.subnet_a_cidr
  subnet_b_cidr                   = var.subnet_b_cidr
  subnet_c_cidr                   = var.subnet_c_cidr
  nodejs_starter_frontend_elb_sgs = [module.security.frontend_elb_sg_id]
}

module "ecr" {
  source = "./Terraform/ecr"

  nodejs_starter_container_registry = {
    name             = "${var.project_name}_container_registry"
    image_mutability = "MUTABLE"
    scan_on_push     = true
    encryption_type  = "KMS"
    tags = {
      name        = "${var.project_name} Container Registry"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
  }
}

module "ecs" {
  source = "./Terraform/ecs"

  nodejs_starter_frontend_ecs_cluster = {
    name = "nodejs_starter_frontend_cluster"
    tags = {
      Name        = "NodeJS Starter Front-End ECS Cluster"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
  }

  nodejs_starter_frontend_ecs_task_definition = {
    family             = "${var.project_name}_frontend"
    vpc                = var.vpc_id
    execution_role_arn = module.security.frontend_ecs_role_arn
    container_name     = "nodejs_starter_frontend_container"
    image              = "${module.ecr.nodejs_starter_frontend_container_registry_url}:${var.frontend_image}"
    port_mappings = [
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

  nodejs_starter_frontend_ecs_service = {
    name          = "nodejs_starter_frontend_service"
    desired_count = 2
    launch_type   = "FARGATE"
    network_configuration = {
      subnets          = module.network.frontend_subnet_ids
      security_groups  = [module.security.frontend_ecs_sg_id]
      assign_public_ip = true
    }
    # load_balancer = {
    #   target_group_arn = module.network.frontend_ecs_tg_id
    #   container_name   = "nodejs_starter_frontend_container"
    #   container_port   = 8080
    # }
    tags = {
      Name        = "NodeJS Starter Front-End ECS Service"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
  }

  nodejs_starter_frontend_lb_tg = {
    name        = "node-starter-frontend-ecs-lb-tg"
    port        = 8080
    protocol    = "HTTP"
    target_type = "ip"
    vpc_id      = var.vpc_id
    health_check = {
      enabled             = true
      healthy_threshold   = 2
      unhealthy_threshold = 10
      interval            = 30
      protocol            = "HTTP"
      matcher             = "200"
      timeout             = 10
    }
    tags = {
      Name        = "NodeJS Starter Front-End ECS Load Balancer Target Group"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
  }

  nodejs_starter_frontend_lb_listener = {
    port                = 8080
    lb_arn              = module.network.frontend_lb_arn
    protocol            = "HTTP"
    default_action_type = "forward"
    tags = {
      Name        = "nodeJS Starter Front-End ECS Load Balancer Listener"
      project     = var.resource_tags.project
      owner       = var.resource_tags.owner
      environment = var.resource_tags.environment
    }
  }

  depends_on = [
    module.network.load_balancers
  ]
}

module "security" {
  source = "./Terraform/security"

  all_traffic   = var.all_traffic
  resource_tags = var.resource_tags
  vpc_id        = var.vpc_id
  vpc_cidr      = var.vpc_cidr
}