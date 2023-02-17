resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

resource "kubernetes_deployment" "argocd" {
  metadata {
    name      = "argocd-deployment"
    namespace = kubernetes_namespace.argocd.metadata.0.name
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "argocd"
      }
    }
    template {
      metadata {
        labels = {
          app = "argocd"
        }
      }
      spec {
        container {
          name  = "argocd"
          image = "argoproj/argocd:v2.4.3"
          port {
            name           = "http"
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "argocd" {
  metadata {
    name      = "argocd"
    namespace = kubernetes_namespace.argocd.metadata.0.name
  }
  spec {
    selector = {
      app = "argocdApp"
    }
    port {
      name        = "http"
      port        = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}
