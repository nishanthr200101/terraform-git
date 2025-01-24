output "organization_url" {
  description = "URL of the organization"
  value       = "https://github.com/${var.organization_name}"
}

output "repository_url" {
  description = "URL of the created repository"
  value       = github_repository.repo.html_url
}