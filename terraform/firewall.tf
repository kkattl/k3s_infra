resource "google_compute_firewall" "allow" {
  name    = var.firewall_name
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = var.firewall_ports
  }

  source_ranges = var.firewall_source_ranges
}
