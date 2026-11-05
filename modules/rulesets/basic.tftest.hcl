run "basic" {
  variables {
    rulesets = {
      "required-attributes" = {
        name = "Required Attributes"

        conditions = {
          ref_name = {
            include = ["~ALL"]
          }

          repository_name = {
            include = ["terraform-github-organisation-test-*"]
          }
        }

        rules = {
          deletion = true
        }
      }

      "all-attributes" = {
        name        = "All Attributes"
        target      = "branch"
        enforcement = "evaluate"

        conditions = {
          ref_name = {
            include = ["~DEFAULT_BRANCH"]
            exclude = ["refs/heads/release/*"]
          }

          repository_name = {
            include   = ["terraform-github-organisation-test-*"]
            exclude   = ["terraform-github-organisation-test-excluded"]
            protected = true
          }
        }

        bypass_actors = [
          {
            actor_type  = "OrganizationAdmin"
            bypass_mode = "always"
          },
          {
            actor_id    = 5
            actor_type  = "RepositoryRole"
            bypass_mode = "pull_request"
          },
        ]

        rules = {
          creation                = true
          update                  = true
          deletion                = true
          non_fast_forward        = true
          required_linear_history = true
          required_signatures     = true

          pull_request = {
            allowed_merge_methods             = ["squash", "rebase"]
            dismiss_stale_reviews_on_push     = true
            require_code_owner_review         = true
            require_last_push_approval        = true
            required_approving_review_count   = 1
            required_review_thread_resolution = true
          }

          required_status_checks = {
            strict_required_status_checks_policy = true
            do_not_enforce_on_create             = true

            required_checks = [
              {
                context = "Lint"
              },
              {
                context        = "Test"
                integration_id = 15368
              },
            ]
          }
        }
      }
    }
  }

  assert {
    condition     = github_organization_ruleset.default["required-attributes"].ruleset_id > 0
    error_message = "Ruleset 'required-attributes' has not been created"
  }

  assert {
    condition     = github_organization_ruleset.default["all-attributes"].ruleset_id > 0
    error_message = "Ruleset 'all-attributes' has not been created"
  }
}
