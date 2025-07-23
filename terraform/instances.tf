# MASTER
resource "google_compute_instance" "master" {
  name         = var.master_name
  machine_type = var.instance_machine_type
  zone         = var.zone
  tags         = [var.master_tag]

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.id

    access_config {}
  }

  metadata_startup_script = file(var.startup_script_path)

  service_account {
    email  = google_service_account.k3s_sa.email
    scopes = var.sa_scopes
  }
}


# WORKERS
resource "google_compute_instance" "worker" {
  count        = var.instance_count_workers
  name         = "${var.worker_name_prefix}-${count.index}"
  machine_type = var.instance_machine_type
  zone         = var.zone
  tags         = [var.worker_tag]

  boot_disk {
    initialize_params {
      image = var.boot_disk_image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id
  }

  metadata_startup_script = file(var.startup_script_path)

  service_account {
    email  = google_service_account.k3s_sa.email
    scopes = var.sa_scopes
  }
}