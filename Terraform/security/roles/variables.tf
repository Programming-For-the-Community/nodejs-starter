# variable "codebuild_role" {
#     description = "CodeBuild Role"
#     type = object({
#         name = string
#         assume_role_policy = string
#         tags = map(string)
#     })
# }

variable "nodejs_starter_frontend_ecs_role" {
    description = "ECS Role"
    type = object({
        name = string
        managed_policy_arns = list(string)
        assume_role_policy = string
        tags = map(string)
    })
}