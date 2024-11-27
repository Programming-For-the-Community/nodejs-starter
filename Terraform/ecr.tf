resource "aws_ecr_repository" "nodejs_starter_container_registry" {
  name                 = "${var.project_name}_container_registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name        = "${var.resource_tags.project} Container Registry"
    project     = var.resource_tags.project
    owner       = var.resource_tags.owner
    environment = var.resource_tags.environment
  }
}
