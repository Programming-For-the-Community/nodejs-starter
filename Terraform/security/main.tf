module "security_groups" {
    source = "./security-groups"

    # codebuild_security_group = {
        
    # }

    nodejs_starter_frontend_ecs_sg = {
        name_prefix = "nodejs_starter_frontend_ecs_sg"
        vpc_id = var.vpc_id
        ingress = {
            from_port = 0 # 8080
            to_port = 0 # 8080
            protocol = "tcp"
            cidr_blocks = [var.vpc_cidr]
        }
        egress = {
            from_port = 0
            to_port = 0
            protocol = "tcp"
            cidr_blocks = [var.all_traffic]
        }
        tags = {
            Name = "NodeJS Starter Front-End ECS Security Group"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }

    nodejs_starter_frontend_elb_sg = {
        name_prefix = "nodejs_starter_frontend_elb_sg"
        vpc_id = var.vpc_id
        ingress = {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = [var.all_traffic] # see if we can fix this
        }
        egress = {
            from_port = 0
            to_port = 0
            protocol = "tcp"
            cidr_blocks = [var.all_traffic]
        }
        tags = {
            Name = "NodeJS Starter Front-End ELB Security Group"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }
}

module "roles" {
    source = "./roles"

    # codebuild_role = {
        
    # }

    nodejs_starter_frontend_ecs_role = {
        name = "nodejs_starter_frontend_ecs_role"
        managed_policy_arns = ["arn:aws:iam::aws:policy/PowerUserAccess", "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"]
        assume_role_policy = jsonencode({
            Version = "2012-10-17"
            Statement = [
                {
                    Action = "sts:AssumeRole"
                    Effect = "Allow"
                    Sid = ""
                    Principal = {
                        Service = "ecs-tasks.amazonaws.com"
                    }
                }
            ]
        })
        tags = {
            Name = "NodeJS Starter Front-EndECS Role"
            project = var.resource_tags.project
            owner = var.resource_tags.owner
            environment = var.resource_tags.environment
        }
    }
}

output "frontend_ecs_role_arn" {
    description = "NodeJS Starter Front-End ECS Role ARN"
    value = module.roles.nodejs_starter_frontend_ecs_role_arn
}

output "frontend_ecs_sg_id" {
    description = "NodeJS Starter Front-End ECS Security Group ID"
    value = module.security_groups.nodejs_starter_frontend_ecs_sg_id
}

output "frontend_elb_sg_id" {
    description = "NodeJS Starter Front-End ELB Security Group ID"
    value = module.security_groups.nodejs_starter_frontend_elb_sg_id
}