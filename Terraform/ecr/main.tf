resource "aws_ecr_repository" "nodejs_starter_container_registry" {
    name = var.nodejs_starter_container_registry.name
    image_tag_mutability = var.nodejs_starter_container_registry.image_mutability

    image_scanning_configuration {
        scan_on_push = var.nodejs_starter_container_registry.scan_on_push
    }

    encryption_configuration {
        encryption_type = var.nodejs_starter_container_registry.encryption_type
    }

    tags = var.nodejs_starter_container_registry.tags
}

output "nodejs_starter_frontend_container_registry_url" {
    description = "nodejs_starter Container Registry URL"
    value = aws_ecr_repository.nodejs_starter_container_registry.repository_url
}