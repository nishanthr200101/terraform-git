variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "organization_name" {
  description = "Name of the existing GitHub organization"
  type        = string
}

variable "organization_email" {
  description = "Email for the GitHub organization"
  type        = string
}

variable "repository_name" {
  description = "Name of the repository to create"
  type        = string
}

variable "repository_description" {
  description = "Description of the repository"
  type        = string
  default     = "Repository created via Terraform"
}

variable "repository_visibility" {
  description = "Visibility of the repository (private or public)"
  type        = string
  default     = "private"
}

variable "team_members" {
  description = "Map of team members to invite with their roles"
  type        = map(string)
  default     = {}
}