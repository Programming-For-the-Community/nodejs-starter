# resource "aws_iam_role" "codebuild_role" {
#     name = var.codebuild_role.name
#     assume_role_policy = var.codebuild_role.assume_role_policy
#     tags = var.codebuild_role.tags
# }

resource "aws_iam_role" "nodejs_starter_frontend_ecs_role" {
    name = var.nodejs_starter_frontend_ecs_role.name
    managed_policy_arns = var.nodejs_starter_frontend_ecs_role.managed_policy_arns
    assume_role_policy = var.nodejs_starter_frontend_ecs_role.assume_role_policy
    tags = var.nodejs_starter_frontend_ecs_role.tags
}

output "nodejs_starter_frontend_ecs_role_arn" {
    description = "NodeJS Starter Front-End ECS Role ARN"
    value = aws_iam_role.nodejs_starter_frontend_ecs_role.arn
}