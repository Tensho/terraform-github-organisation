variable "apps" {
  description = "GitHub Apps installed on the organisation. Repository access is authoritative: unlisted repositories lose access."

  type = map(object({
    app_slug     = string
    repositories = list(string)
  }))

  default = {}
}
