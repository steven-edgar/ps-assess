resource "google_container_cluster" "ps_assessment" {
  name = "ps-assessment"
  location = var.gcp_zone
  remove_default_node_pool = true
  initial_node_count = 1
}


