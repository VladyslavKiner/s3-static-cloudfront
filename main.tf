module "cdn" {
  source                            = "cloudposse/cloudfront-s3-cdn/aws"
  name                              = var.name
  aliases                           = ["${var.domain_name}"]
  dns_alias_enabled                 = true
  parent_zone_id                    = data.aws_route53_zone.default.id
  ipv6_enabled                      = false
  cloudfront_access_logging_enabled = false
  allowed_methods                   = var.allowed_methods
  acm_certificate_arn               = module.acm_request_certificate.arn

  depends_on = [module.acm_request_certificate]
}

# getting the route53_zone to retrieve zone ID
data "aws_route53_zone" "default" {
  name = var.domain_name
}

# Placing index.html file in S3 bucket
resource "aws_s3_object" "maintenance" {
  bucket       = module.cdn.s3_bucket
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"

  depends_on = [module.cdn]
}

# create a certificate for vkiner.com domain
module "acm_request_certificate" {
  source                            = "cloudposse/acm-request-certificate/aws"
  domain_name                       = var.domain_name
  process_domain_validation_options = true
  ttl                               = "300"
  wait_for_certificate_issued       = true
  zone_name                         = var.domain_name
}