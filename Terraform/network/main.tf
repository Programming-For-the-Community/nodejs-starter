module "subnets" {
    source = "./subnets"
    nodejs_starter_east2a = {
        vpc_id = var.vpc_id
        cidr_block = var.subnet_a_cidr
        availability_zone = "${var.region}a"
        tags = {
            Name = "NodeJS Starter Subnet East 2A" 
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

    nodejs_starter_east2b = {
        vpc_id = var.vpc_id
        cidr_block = var.subnet_b_cidr
        availability_zone = "${var.region}b"
        tags = {
            Name = "NodeJS Starter Subnet East 2B" 
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

    nodejs_starter_east2c = {
        vpc_id = var.vpc_id
        cidr_block = var.subnet_c_cidr
        availability_zone = "${var.region}c"
        tags = {
            Name = "NodeJS Starter Subnet East 2C" 
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }
}

module "internet_gateways" {
    source = "./internet-gateways"

    nodejs_starter_ig = {
        vpc_id = var.vpc_id
        tags = {
            Name = "NodeJS Starter Internet Gateway"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }
}

module "load_balancers" {
    source = "./load-balancers"

    nodejs_starter_frontend_lb = {
        name = "nodejs-starter-frontend-ecs-lb"
        internal = false
        load_balancer_type = "application"
        security_groups = var.nodejs_starter_frontend_elb_sgs
        subnets = module.subnets.frontend_subnet_ids
        tags = {
            Name = "NodeJS Starter Front-End ECS Load Balancer"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

    nodejs_starter_frontend_lb_tg = {
        name = "node-starter-frontend-ecs-lb-tg"
        port = 8080
        protocol = "HTTP"
        target_type = "ip"
        vpc_id = var.vpc_id
        health_check = {
            enabled = true
            healthy_threshold = 2
            unhealthy_threshold = 10
            interval = 30
            protocol = "HTTP"
            matcher = "200"
            timeout = 10
        }
        tags = {
            Name = "NodeJS Starter Front-End ECS Load Balancer Target Group"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

    nodejs_starter_frontend_lb_listener = {
        port = 8080
        protocol = "HTTP"
        default_action_type = "forward"
        tags = {
            Name = "nodeJS Starter Front-End ECS Load Balancer Listener"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

}

module "route_tables" {
    source = "./route-tables" 

    nodejs_starter_frontend_route_table = {
        vpc_id = var.vpc_id
        subnet_ids = module.subnets.frontend_subnet_ids
        gateway_id = module.internet_gateways.nodejs_starter_ig_id
        cidr_block = var.all_traffic
        tags = {
            Name = "NodeJS Starter Front-End Route Table"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

}

output "frontend_subnet_ids" {
    description = "NodeJS Starter Front-End Subnet IDs"
    value = module.subnets.frontend_subnet_ids
}

output "frontend_ecs_tg_id" {
    description = "NodeJS Starter Front-End ECS Target Group ID"
    value = module.load_balancers.nodejs_starter_frontend_tg_id
}