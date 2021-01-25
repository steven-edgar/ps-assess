resource "kubernetes_deployment" "ps_assessement" {
    metadata {
        name = "regres-products"
        labels = {
            app = "regres-products"
        }
    }
    spec {
        replicas = 1
        selector {
            match_labels = {
                app = "regres-products"
            }
        }
        template {
            metadata {
                labels = {
                    app = "regres-products"
                }
            }
            spec {
                container {
                    image = "eu.gcr.io/${data.google_project.project.name}/paymentsense:latest"
                    name = "regres-products"

                    port {
                        name = "http"
                        container_port = 5000
                        protocol = "TCP"
                    }

                    #Should define resources and limits here

                    liveness_probe {
                        http_get {
                            path = "/"
                            port = "5000"
                        }
                        initial_delay_seconds = 5
                    }

                }
            }
        }
    }
    depends_on = [
        google_project_iam_member.storage-object-viewer,
        google_service_account.default,
        google_container_node_pool.ps_assessment_np
    ]
}
