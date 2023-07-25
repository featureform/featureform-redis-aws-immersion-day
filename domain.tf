locals {
  domain = lower("${var.project}.${var.hosted_zone}")
}

resource "aws_route53_zone" "featureform" {
  name = var.hosted_zone
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_route53_record" "featureform" {
  zone_id = aws_route53_zone.featureform.zone_id
  name = local.domain
  type = "CNAME"
  ttl = 300
  records = [local.ingress_domain]
}

locals {
  ingress_domain = data.external.ingress.result["host"]
}

data "external" "ingress" {
  program = ["./get_ingress_json.sh"]
  depends_on = [helm_release.featureform]
}
