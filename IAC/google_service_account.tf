resource "google_service_account" "default" {
  provider = google

  account_id   = "default-53677433887"
  display_name = "Minimal service account for GKE cluster"
  project      = data.google_project.project.name
}

