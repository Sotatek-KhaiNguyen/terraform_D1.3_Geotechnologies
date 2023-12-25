resource "aws_route53_record" "record" {
  zone_id = var.hosted_zone_public_id
  name = var.name
  type = "A"
  alias {
    name = var.cf_s3_domain_name
    zone_id = var.cf_s3_hosted_zone_id
    evaluate_target_health = false
  }
}
