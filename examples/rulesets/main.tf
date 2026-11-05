# tflint-ignore: terraform_required_version
module "example" {
  source = "../../modules/rulesets"

  rulesets = {
    "example-default-branch" = {
      name = "Example Default Branch"

      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        }

        repository_name = {
          include = ["terraform-github-organisation-example-*"]
        }
      }

      bypass_actors = [
        {
          actor_type  = "OrganizationAdmin"
          bypass_mode = "always"
        },
      ]

      rules = {
        deletion                = true
        non_fast_forward        = true
        required_linear_history = true

        pull_request = {
          allowed_merge_methods             = ["squash", "rebase"]
          dismiss_stale_reviews_on_push     = true
          required_approving_review_count   = 1
          required_review_thread_resolution = true
        }

        required_status_checks = {
          strict_required_status_checks_policy = true

          required_checks = [
            {
              context = "Lint"
            },
            {
              context = "Test"
            },
          ]
        }
      }
    }

    "example-release-tags" = {
      name = "Example Release Tags"

      target = "tag"

      conditions = {
        ref_name = {
          include = ["refs/tags/v*"]
        }

        repository_name = {
          include = ["terraform-github-organisation-example-*"]
        }
      }

      rules = {
        update   = true
        deletion = true
      }
    }
  }
}
