output "lesson_summary" {
  description = "Values stored by the local terraform_data resource."
  value       = terraform_data.lesson.output
}
