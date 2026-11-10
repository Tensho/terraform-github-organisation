# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/teams"

  teams = {
    "maintainers" = {
      name        = "Maintainers"
      description = "Repository maintainers"

      members = {
        "octocat" = "maintainer"
      }
    }

    "developers" = {
      name                 = "Developers"
      privacy              = "secret"
      notification_setting = "notifications_disabled"

      members = {
        "octocat" = "member"
      }
    }
  }
}
