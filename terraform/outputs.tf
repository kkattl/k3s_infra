output "master_ip" {
  value = google_compute_instance.k3s[0].network_interface[0].access_config[0].nat_ip
}

output "worker_ips" {
  value = slice(
    [for i in google_compute_instance.k3s : i.network_interface[0].access_config[0].nat_ip],
    1,
    length(google_compute_instance.k3s)
  )
}