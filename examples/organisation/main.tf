# tflint-ignore: terraform_required_version
module "example" {
  source = "../.."

  # Destroy resets the billing email to this value, so apply and destroy agree.
  billing_email = "email@example.com"

  default_repository_permission = "read"

  members_can_create_repositories         = true
  members_can_create_public_repositories  = true
  members_can_create_private_repositories = true
  members_can_fork_private_repositories   = false

  web_commit_signoff_required = false
}
