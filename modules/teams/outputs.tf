output "team_ids" {
  description = "Team IDs"

  value = {
    for team_key, team in github_team.default : team_key => team.id
  }
}

output "team_slugs" {
  description = "Team slugs"

  value = {
    for team_key, team in github_team.default : team_key => team.slug
  }
}
