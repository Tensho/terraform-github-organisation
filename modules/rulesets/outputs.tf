output "ruleset_ids" {
  description = "Ruleset IDs"

  value = {
    for ruleset_key, ruleset in github_organization_ruleset.default : ruleset_key => ruleset.ruleset_id
  }
}
