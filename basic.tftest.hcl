# Destroying organisation settings resets the billing email to `email@example.com`
# instead of restoring the previous values, so the test runs in plan mode to leave the organisation untouched.

run "required_attributes" {
  command = plan

  variables {
    billing_email = "billing@example.com"
  }

  assert {
    condition     = github_organization_settings.default.billing_email == "billing@example.com"
    error_message = "Organisation billing email has not been planned"
  }
}

run "all_attributes" {
  command = plan

  variables {
    billing_email = "billing@example.com"

    name        = "Test"
    description = "Terraform GitHub organisation module test"
    email       = "hello@example.com"
    blog        = "https://example.com"
    company     = "Test"
    location    = "London"

    default_repository_permission = "read"

    members_can_create_repositories         = true
    members_can_create_public_repositories  = false
    members_can_create_private_repositories = true
    members_can_fork_private_repositories   = false

    web_commit_signoff_required = true
  }

  assert {
    condition     = github_organization_settings.default.default_repository_permission == "read"
    error_message = "Organisation default repository permission has not been planned"
  }

  assert {
    condition     = github_organization_settings.default.web_commit_signoff_required == true
    error_message = "Organisation web commit sign-off has not been planned"
  }
}
