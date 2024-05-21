variable "subject" {
  type        = object({
    common_name = optional(string)
    country             = optional(string)
    locality            = optional(string)
    organization        = optional(string)
    organizational_unit = optional(string)
    postal_code         = optional(string)
    province            = optional(string)
    serial_number       = optional(number)
  })
  description = "Root certificate subject"
}

variable "validity_in_hours" {
  # 20 years by default
  default = 175200
}