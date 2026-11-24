output "installation_ids" {
  description = "GitHub App installation IDs"

  value = {
    for app_key, installation in github_app_installation_repositories.default : app_key => installation.installation_id
  }
}
