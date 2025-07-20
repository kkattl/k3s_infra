resource "google_compute_firewall" "allow_ssh" {
  name    = var.firewall_ssh_name
  network = google_compute_network.vpc.name

  allow { 
    protocol = "tcp" 
    ports = ["22"] 
    }

  source_ranges = var.trusted_cidrs
  target_tags   = [var.master_tag]
}

resource "google_compute_firewall" "allow_lb" {
  name    = var.firewall_lb_name
  network = google_compute_network.vpc.name

  allow { 
    protocol = "tcp" 
    ports = var.lb_ports 
    }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = [var.master_tag]
}

resource "google_compute_firewall" "allow_internal" {
  name    = var.firewall_internal_name
  network = google_compute_network.vpc.name

  allow { protocol = "all" }

  source_ranges = [var.subnet_public_cidr, var.subnet_private_cidr]
  target_tags   = [var.master_tag, var.worker_tag]
}
