# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/apps"

  apps = {
    "ci" = {
      app_slug = "example-ci"

      repositories = [
        "infrastructure",
        "terraform-modules",
      ]
    }
  }
}
