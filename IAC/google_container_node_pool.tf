resource "google_container_node_pool" "ps_assessment_np" {
        name = "ps-assessment-np"
        location = var.gcp_zone
        cluster = google_container_cluster.ps_assessment.name
        initial_node_count = 1

        node_config {
            preemptible = true
            machine_type = "n1-standard-1"

            service_account = google_service_account.default.email
            oauth_scopes = [ "https://www.googleapis.com/auth/cloud-platform" ]
        }

        autoscaling {
            min_node_count = 1
            max_node_count = 3
        }

        management {
            auto_repair = true
        }

        upgrade_settings {
            max_surge = 1
            max_unavailable = 1
        }
        
}

