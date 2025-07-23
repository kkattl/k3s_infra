resource "google_service_account" "k3s_sa" {
  account_id   = var.sa_account_id
  display_name = var.sa_display_name
}                                          

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.k3s_sa.name
  keepers = { last_rotation = timestamp() }
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}                                              