resource "github_organization_ruleset" "default" {
  for_each = var.rulesets

  name        = each.value.name
  target      = each.value.target
  enforcement = each.value.enforcement

  conditions {
    dynamic "ref_name" {
      for_each = each.value.conditions.ref_name != null ? [each.value.conditions.ref_name] : []

      content {
        include = ref_name.value.include
        exclude = ref_name.value.exclude
      }
    }

    repository_name {
      include   = each.value.conditions.repository_name.include
      exclude   = each.value.conditions.repository_name.exclude
      protected = each.value.conditions.repository_name.protected
    }
  }

  dynamic "bypass_actors" {
    for_each = each.value.bypass_actors

    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = bypass_actors.value.bypass_mode
    }
  }

  rules {
    creation                = each.value.rules.creation
    update                  = each.value.rules.update
    deletion                = each.value.rules.deletion
    non_fast_forward        = each.value.rules.non_fast_forward
    required_linear_history = each.value.rules.required_linear_history
    required_signatures     = each.value.rules.required_signatures

    dynamic "pull_request" {
      for_each = each.value.rules.pull_request != null ? [each.value.rules.pull_request] : []

      content {
        allowed_merge_methods             = pull_request.value.allowed_merge_methods
        dismiss_stale_reviews_on_push     = pull_request.value.dismiss_stale_reviews_on_push
        require_code_owner_review         = pull_request.value.require_code_owner_review
        require_last_push_approval        = pull_request.value.require_last_push_approval
        required_approving_review_count   = pull_request.value.required_approving_review_count
        required_review_thread_resolution = pull_request.value.required_review_thread_resolution
      }
    }

    dynamic "required_status_checks" {
      for_each = each.value.rules.required_status_checks != null ? [each.value.rules.required_status_checks] : []

      content {
        strict_required_status_checks_policy = required_status_checks.value.strict_required_status_checks_policy
        do_not_enforce_on_create             = required_status_checks.value.do_not_enforce_on_create

        dynamic "required_check" {
          for_each = required_status_checks.value.required_checks

          content {
            context        = required_check.value.context
            integration_id = required_check.value.integration_id
          }
        }
      }
    }
  }
}
