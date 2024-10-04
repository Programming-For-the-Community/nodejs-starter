variable "nodejs_starter_container_registry" {
    description = "ECR for the NodeJS Starter Project"
    type = object({
        name = string
        image_mutability = string
        scan_on_push = bool
        encryption_type = string
        tags = map(string)
    })
}