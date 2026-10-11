resource "ovh_cloud_project_database_opensearch_user" "cloud_project_database_opensearch_users" {
  for_each = var.cloud_project_database_opensearch_users

  cluster_id     = each.value.cluster_id
  name           = each.value.name
  service_name   = each.value.service_name
  password_reset = each.value.password_reset

  dynamic "acls" {
    for_each = each.value.acls != null ? each.value.acls : []
    content {
      pattern    = acls.value.pattern
      permission = acls.value.permission
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

