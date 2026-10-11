resource "google_compute_instant_snapshot" "compute_instant_snapshots" {
  for_each = var.compute_instant_snapshots

  name            = each.value.name
  source_disk     = each.value.source_disk
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project
  zone            = each.value.zone

  dynamic "params" {
    for_each = each.value.params != null ? [each.value.params] : []
    content {
      resource_manager_tags = params.value.resource_manager_tags
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

