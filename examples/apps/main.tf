# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/apps"

  apps = {
    "ci" = {
      app_slug = "tensho-playground"

      repositories = [
        "terraform-github-organisation-apps-test",
      ]
    }
  }
}
