resource "aws_ecr_repository" "api" {
  name = "api"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    Name = format("%s-crud-app", var.prefix)
  }
}
