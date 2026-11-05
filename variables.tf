variable "billing_email" {
  description = "Organisation billing email."
  type        = string
}

variable "name" {
  description = "Organisation display name."
  type        = string
  default     = null
}

variable "description" {
  description = "Organisation description."
  type        = string
  default     = null
}

variable "email" {
  description = "Organisation public email."
  type        = string
  default     = null
}

variable "blog" {
  description = "Organisation blog URL."
  type        = string
  default     = null
}

variable "company" {
  description = "Organisation company name."
  type        = string
  default     = null
}

variable "location" {
  description = "Organisation location."
  type        = string
  default     = null
}

variable "default_repository_permission" {
  description = "Default repository permission for members: `read`, `write`, `admin` or `none`."
  type        = string
  default     = null
}

variable "members_can_create_repositories" {
  description = "Allow members to create repositories."
  type        = bool
  default     = null
}

variable "members_can_create_public_repositories" {
  description = "Allow members to create public repositories."
  type        = bool
  default     = null
}

variable "members_can_create_private_repositories" {
  description = "Allow members to create private repositories."
  type        = bool
  default     = null
}

variable "members_can_fork_private_repositories" {
  description = "Allow members to fork private repositories."
  type        = bool
  default     = null
}

variable "web_commit_signoff_required" {
  description = "Require sign-off on web-based commits."
  type        = bool
  default     = null
}
