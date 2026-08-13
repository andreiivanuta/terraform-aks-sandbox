variable "learner_name" {
  description = "Name used in the local learning output. Do not enter personal information."
  type        = string
  default     = "Terraform learner"

  validation {
    condition     = length(trimspace(var.learner_name)) > 0
    error_message = "learner_name must not be empty."
  }
}
