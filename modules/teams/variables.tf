variable "teams" {
  description = "Organisation teams. Membership is additive: unlisted members are left untouched."

  type = map(object({
    name                 = string
    description          = optional(string)
    privacy              = optional(string, "closed")
    notification_setting = optional(string, "notifications_enabled")
    parent_team_id       = optional(string)
    members              = optional(map(string), {})
  }))

  default = {}
}
