resource "google_service_account" "k3s_sa" {
  account_id   = "k3s-terraform"
  display_name = "Terraform automation for k3s"
}                                              

resource "google_service_account_key" "sa_key" {
  service_account_id = google_service_account.k3s_sa.name
  keepers = { last_rotation = timestamp() }
  private_key_type   = "TYPE_GOOGLE_CREDENTIALS_FILE"
}                                              