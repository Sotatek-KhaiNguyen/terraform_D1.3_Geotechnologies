resource "aws_ecr_repository" "ecr" {
    name = "${var.common.env}-${var.common.project}-ecr"
    image_tag_mutability = var.image_tag_mutability
    image_scanning_configuration {
        scan_on_push = "true"
    }
}