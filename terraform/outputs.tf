output "master_ip" {
  description = "External IPv4 of the control‑plane node"
  value       = google_compute_instance.master.network_interface[0].access_config[0].nat_ip
}

output "worker_private_ips" {
  description = "Internal IPv4 addresses of worker nodes"
  value       = [
    for w in google_compute_instance.worker :
    w.network_interface[0].network_ip
  ]
}

output "service_account_email" {
  value       = google_service_account.k3s_sa.email
  description = "Email of the Terraform service account"
}
