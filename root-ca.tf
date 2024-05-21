resource "tls_private_key" "root_ca" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "tls_self_signed_cert" "root_ca" {
  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing"
  ]
  private_key_pem = tls_private_key.root_ca.private_key_pem
  # 20 year validity
  validity_period_hours = var.validity_in_hours
  is_ca_certificate     = true

  dynamic "subject" {
    for_each = [var.subject]
    content {
      common_name         = var.subject.common_name
      country             = var.subject.country
      locality            = var.subject.locality
      organization        = var.subject.organization
      organizational_unit = var.subject.organizational_unit
      postal_code         = var.subject.postal_code
      province            = var.subject.province
      serial_number       = var.subject.serial_number
    }
  }
}
