# GitHub Organisation Terraform Module

Terraform module to manage [GitHub](https://github.com) organisation resources.

## Usage

```hcl
module "organisation" {
  source = "Tensho/organisation/github"
  version = "~> 1.0"

  billing_email = "billing@example.com"

  name                          = "Example"
  default_repository_permission = "read"
  web_commit_signoff_required   = true
}

module "rulesets" {
  source = "Tensho/organisation/github//modules/rulesets"
  version = "~> 1.0"

  rulesets = {
    "protect-default-branch" = {
      name = "Protect Default Branch"

      conditions = {
        ref_name = {
          include = ["~DEFAULT_BRANCH"]
        }

        repository_name = {
          include = ["~ALL"]
        }
      }

      rules = {
        deletion = true
      }
    }
  }
}
```

Check out comprehensive examples in [`examples`](./examples) folder.

## Features

> [!NOTE]
> This module covers organisation-scoped resources only.
> Repository-scoped resources live in [terraform-github-repository](https://github.com/Tensho/terraform-github-repository).

* [x] [Organization settings](https://docs.github.com/en/organizations/managing-organization-settings)
* [ ] [Members](https://docs.github.com/en/organizations/managing-membership-in-your-organization)
* [x] [Teams](https://docs.github.com/en/organizations/organizing-members-into-teams)
* [ ] [Team synchronization](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-saml-single-sign-on-for-your-organization/managing-team-synchronization-for-your-organization)
* [ ] [Organization roles](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-peoples-access-to-your-organization-with-roles/permissions-of-custom-organization-roles)
* [ ] [Repository roles](https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-user-access-to-your-organizations-repositories/managing-repository-roles/about-custom-repository-roles)
* [ ] [Blocked users](https://docs.github.com/en/communities/maintaining-your-safety-on-github/blocking-a-user-from-your-organization)
* [x] [Rulesets](https://docs.github.com/en/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization)
* [ ] [Custom properties](https://docs.github.com/en/organizations/managing-organization-settings/managing-custom-properties-for-repositories-in-your-organization)
* [ ] [Actions permissions](https://docs.github.com/en/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization)
* [ ] [Actions OpenID Connect](https://docs.github.com/en/actions/concepts/security/openid-connect)
* [ ] [Actions runner groups](https://docs.github.com/en/actions/how-tos/manage-runners/self-hosted-runners/manage-access)
* [ ] [Actions larger runners](https://docs.github.com/en/actions/concepts/runners/larger-runners)
* [ ] [Webhooks](https://docs.github.com/en/webhooks/about-webhooks)
* [ ] [Actions secrets](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets)
* [ ] [Actions variables](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-variables)
* [ ] [Dependabot secrets](https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/manage-your-dependency-security/configure-access-to-private-registries)
* [ ] [Codespaces secrets](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-development-environment-secrets-for-your-repository-or-organization)
* [ ] [GitHub Apps](https://docs.github.com/en/apps/using-github-apps/reviewing-and-modifying-installed-github-apps)

## Modules

* [rulesets](modules/rulesets)
* [teams](modules/teams)

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
| [github_organization_settings.default](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_billing_email"></a> [billing\_email](#input\_billing\_email) | Organisation billing email. | `string` | n/a | yes |
| <a name="input_blog"></a> [blog](#input\_blog) | Organisation blog URL. | `string` | `null` | no |
| <a name="input_company"></a> [company](#input\_company) | Organisation company name. | `string` | `null` | no |
| <a name="input_default_repository_permission"></a> [default\_repository\_permission](#input\_default\_repository\_permission) | Default repository permission for members: `read`, `write`, `admin` or `none`. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Organisation description. | `string` | `null` | no |
| <a name="input_email"></a> [email](#input\_email) | Organisation public email. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Organisation location. | `string` | `null` | no |
| <a name="input_members_can_create_private_repositories"></a> [members\_can\_create\_private\_repositories](#input\_members\_can\_create\_private\_repositories) | Allow members to create private repositories. | `bool` | `null` | no |
| <a name="input_members_can_create_public_repositories"></a> [members\_can\_create\_public\_repositories](#input\_members\_can\_create\_public\_repositories) | Allow members to create public repositories. | `bool` | `null` | no |
| <a name="input_members_can_create_repositories"></a> [members\_can\_create\_repositories](#input\_members\_can\_create\_repositories) | Allow members to create repositories. | `bool` | `null` | no |
| <a name="input_members_can_fork_private_repositories"></a> [members\_can\_fork\_private\_repositories](#input\_members\_can\_fork\_private\_repositories) | Allow members to fork private repositories. | `bool` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Organisation display name. | `string` | `null` | no |
| <a name="input_web_commit_signoff_required"></a> [web\_commit\_signoff\_required](#input\_web\_commit\_signoff\_required) | Require sign-off on web-based commits. | `bool` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_id"></a> [id](#output\_id) | Organisation ID |
<!-- END_TF_DOCS -->
