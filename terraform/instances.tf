resource "google_compute_instance" "k3s" {
  count        = var.instance_count
  name         = "${var.instance_name_prefix}-${count.index}"
  machine_type = var.machine_type
  tags         = var.instance_tags

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    subnetwork    = google_compute_subnetwork.subnet.id
    access_config {}
  }

  metadata_startup_script = file(var.startup_script_path)

  service_account {
    email  = google_service_account.k3s_sa.email
    scopes = var.service_account_scopes
  }
}
