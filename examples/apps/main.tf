# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/apps"

  apps = {
    "example" = {
      app_slug = "tensho-playground"

      repositories = [
        # "tensho-playground",
        "terraform-github-organisation-apps-test",
      ]
    }
  }
}
