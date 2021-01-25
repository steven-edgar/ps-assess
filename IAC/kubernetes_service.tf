
resource "kubernetes_service" "regres-products" {
    metadata {
        name = "regres-products"
    }

    spec {
        selector = {
            app = "regres-products"
        }
        port {
            port = 5000
            target_port = 5000
        }
        type = "LoadBalancer"
    }

    depends_on = [kubernetes_deployment.ps_assessement]
}

output "load_balancer_ingress" {
    value = kubernetes_service.regres-products.load_balancer_ingress
}
