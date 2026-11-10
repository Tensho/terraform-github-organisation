run "basic" {
  variables {
    teams = {
      "required-attributes" = {
        name = "terraform-github-organisation-test-required-attributes"
      }

      "all-attributes" = {
        name                 = "terraform-github-organisation-test-all-attributes"
        description          = "Terraform GitHub organisation module test"
        privacy              = "secret"
        notification_setting = "notifications_disabled"

        members = {
          "Tensho" = "maintainer"
        }
      }
    }
  }

  assert {
    condition     = github_team.default["required-attributes"].privacy == "closed"
    error_message = "Team privacy is not 'closed' by default"
  }

  assert {
    condition     = github_team.default["all-attributes"].privacy == "secret"
    error_message = "Team privacy has not been updated"
  }

  assert {
    condition     = github_team_membership.default["all-attributes/Tensho"].role == "maintainer"
    error_message = "Team member has not been added"
  }

  assert {
    condition     = output.team_slugs["required-attributes"] == "terraform-github-organisation-test-required-attributes"
    error_message = "Team slug output is wrong"
  }
}
