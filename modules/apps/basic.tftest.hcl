run "setup_repository" {
  module {
    source  = "Tensho/repository/github"
    version = "1.5.0"
  }

  variables {
    name               = "terraform-github-organisation-apps-test"
    archive_on_destroy = false
  }
}

run "required_attributes" {
  assert {
    condition     = length(github_app_installation_repositories.default) == 0
    error_message = "Repository access has been granted without apps"
  }
}

run "all_attributes" {
  variables {
    apps = {
      "test" = {
        app_slug     = "tensho-playground"
        repositories = [run.setup_repository.name]
      }
    }
  }

  assert {
    condition     = github_app_installation_repositories.default["test"].selected_repositories == toset([run.setup_repository.name])
    error_message = "Repository access has not been granted"
  }

  assert {
    condition     = output.installation_ids["test"] != ""
    error_message = "Installation ID output is empty"
  }
}
