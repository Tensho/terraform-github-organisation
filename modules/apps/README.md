# Apps

Manages repository access of GitHub Apps installed on the organisation.

The module finds each installation by the App slug, the last segment of `https://github.com/apps/<slug>`. The installation must use "Only select repositories" access.

Repository access is authoritative: the module grants access to listed repositories and revokes it from the rest.

> [!IMPORTANT]
> GitHub serves this API to user tokens only. Authenticate the provider with a personal access token of an organisation owner, not with a GitHub App installation token.

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
| [github_app_installation_repositories.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repositories) | resource |
| [github_organization_app_installations.default](https://registry.terraform.io/providers/integrations/github/latest/docs/data-sources/organization_app_installations) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_apps"></a> [apps](#input\_apps) | GitHub Apps installed on the organisation. Repository access is authoritative: unlisted repositories lose access. | <pre>map(object({<br/>    app_slug     = string<br/>    repositories = list(string)<br/>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_installation_ids"></a> [installation\_ids](#output\_installation\_ids) | GitHub App installation IDs |
<!-- END_TF_DOCS -->
