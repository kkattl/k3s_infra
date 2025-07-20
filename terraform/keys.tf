resource "google_compute_project_metadata" "ssh_keys" {
  metadata = {
    ssh-keys = "ansible:${file(var.ansible_pubkey_path)}"
  }
}