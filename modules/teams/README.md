# Teams

Manages organisation teams and their members.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.13 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.13 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [github_team.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team) | resource |
| [github_team_membership.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_teams"></a> [teams](#input\_teams) | Organisation teams. Membership is additive: unlisted members are left untouched. | <pre>map(object({<br/>    name                 = string<br/>    description          = optional(string)<br/>    privacy              = optional(string, "closed")<br/>    notification_setting = optional(string, "notifications_enabled")<br/>    parent_team_id       = optional(string)<br/>    members              = optional(map(string), {})<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_team_ids"></a> [team\_ids](#output\_team\_ids) | Team IDs |
| <a name="output_team_slugs"></a> [team\_slugs](#output\_team\_slugs) | Team slugs |
<!-- END_TF_DOCS -->
