# GitHub Organization Terraform Configuration

This Terraform project manages a GitHub organization, including:
- Organization settings
- Repository creation
- Branch protection rules
- Directory structure
- Team member management

## Prerequisites

- Terraform installed (version 1.0.0 or later)
- GitHub account with appropriate permissions
- GitHub Personal Access Token with required scopes

## Usage

1. Clone this repository
2. Update `terraform.tfvars` with your values
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Preview changes:
   ```bash
   terraform plan
   ```
5. Apply changes:
   ```bash
   terraform apply
   ```

## Variables

See `variables.tf` for all available variables and their descriptions.

## Outputs

The configuration outputs various URLs for the created resources.

## Directory Structure

The created repository will include the following directories:
- `src/`: Source code
- `docs/`: Documentation
- `tests/`: Test files
- `scripts/`: Utility scripts
- `deploy/`: Deployment configurations
- `config/`: Configuration files
- `.github/workflows/`: GitHub Actions workflows

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request