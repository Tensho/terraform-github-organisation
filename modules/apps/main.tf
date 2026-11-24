data "github_organization_app_installations" "default" {}

locals {
  installation_ids = {
    for installation in data.github_organization_app_installations.default.installations :
    installation.app_slug => installation.id
  }
}

resource "github_app_installation_repositories" "default" {
  for_each = var.apps

  installation_id       = lookup(local.installation_ids, each.value.app_slug, null)
  selected_repositories = toset(each.value.repositories)

  lifecycle {
    precondition {
      condition     = contains(keys(local.installation_ids), each.value.app_slug)
      error_message = "GitHub App '${each.value.app_slug}' is not installed on the organisation."
    }
  }
}
