variable "cloud_project_database_opensearch_users" {
  description = <<EOT
Map of cloud_project_database_opensearch_users, attributes below
Required:
    - cluster_id
    - name
    - service_name
Optional:
    - password_reset
    - acls (block):
        - pattern (required)
        - permission (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    cluster_id     = string
    name           = string
    service_name   = string
    password_reset = optional(string)
    acls = optional(list(object({
      pattern    = string
      permission = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

