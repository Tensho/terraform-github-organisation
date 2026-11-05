resource "github_organization_settings" "default" {
  billing_email = var.billing_email

  name        = var.name
  description = var.description
  email       = var.email
  blog        = var.blog
  company     = var.company
  location    = var.location

  default_repository_permission = var.default_repository_permission

  members_can_create_repositories         = var.members_can_create_repositories
  members_can_create_public_repositories  = var.members_can_create_public_repositories
  members_can_create_private_repositories = var.members_can_create_private_repositories
  members_can_fork_private_repositories   = var.members_can_fork_private_repositories

  web_commit_signoff_required = var.web_commit_signoff_required
}
