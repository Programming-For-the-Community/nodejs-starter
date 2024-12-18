resource "aws_ecr_repository" "nodejs_starter_container_registry" {
  name                 = "${var.tf_project_name}_container_registry"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }

  tags = {
    name        = "${var.tf_project_name} Container Registry"
    project     = var.project
    owner       = var.owner
    environment = var.environment
  }
}
