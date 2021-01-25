provider "kubernetes" {
   client_certificate = base64decode(google_container_cluster.ps_assessment.master_auth.0.client_certificate)
   client_key = base64decode(google_container_cluster.ps_assessment.master_auth.0.client_key)
   cluster_ca_certificate = base64decode(google_container_cluster.ps_assessment.master_auth.0.cluster_ca_certificate)
   token = data.google_client_config.provider.access_token
   host = google_container_cluster.ps_assessment.endpoint

}
