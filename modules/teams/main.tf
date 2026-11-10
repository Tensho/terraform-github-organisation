resource "github_team" "default" {
  for_each = var.teams

  name                 = each.value.name
  description          = each.value.description
  privacy              = each.value.privacy
  notification_setting = each.value.notification_setting
  parent_team_id       = each.value.parent_team_id
}

resource "github_team_membership" "default" {
  for_each = merge([
    for team_key, team in var.teams : {
      for username, role in team.members : "${team_key}/${username}" => {
        team_key = team_key
        username = username
        role     = role
      }
    }
  ]...)

  team_id  = github_team.default[each.value.team_key].id
  username = each.value.username
  role     = each.value.role
}
