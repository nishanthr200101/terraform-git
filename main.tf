terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.github_token
  owner = var.organization_name
}

# Manage existing organization settings
resource "github_organization_settings" "org" {
  name                           = var.organization_name
  email                         = var.organization_email
  billing_email                 = var.organization_email
  company                       = var.organization_name
  default_repository_permission = "read"
  members_can_create_repositories = true
}

# Create Repository
resource "github_repository" "repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = var.repository_visibility

  allow_merge_commit = true
  allow_rebase_merge = true
  allow_squash_merge = true
  auto_init         = true

  vulnerability_alerts = true
}

# Add README file
resource "github_repository_file" "readme" {
  repository          = github_repository.repo.name
  branch              = "main"
  file                = "README.md"
  content             = <<-EOT
# ${var.repository_name}

## Description
${var.repository_description}

## Project Structure
```
├── src/
├── docs/
├── tests/
└── config/
```

## Getting Started
Instructions for setting up and running the project.

### Prerequisites
- List prerequisites here

### Installation
1. Clone the repository
   ```bash
   git clone https://github.com/${var.organization_name}/${var.repository_name}.git
   ```
2. Additional setup steps...

## Usage
How to use this project...

## Contributing
Guidelines for contributing to this project.

## Team
${join("\n", [for username, role in var.team_members : "- @${username} (${role})" ])}

## License
This project is licensed under the MIT License - see the LICENSE file for details.
  EOT
  commit_message      = "Initial README.md"
  commit_author       = "Terraform"
  commit_email        = var.organization_email
  overwrite_on_create = true

  depends_on = [github_repository.repo]
}

# Add team members to the organization
resource "github_membership" "members" {
  for_each = var.team_members
  
  username = each.key
  role     = each.value
}