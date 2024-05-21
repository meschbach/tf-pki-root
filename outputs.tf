output "pki_cert" {
  value = {
    ca   = [tls_self_signed_cert.root_ca.cert_pem]
    cert = tls_self_signed_cert.root_ca.cert_pem
    key  = tls_private_key.root_ca.private_key_pem
  }
}
