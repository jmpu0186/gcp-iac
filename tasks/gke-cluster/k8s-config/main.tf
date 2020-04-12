#1. Se importa configuracion de ingress-controller se utiliza NGINX (LoadBalancer)
#Repositrio terraform utilizado 
#https://github.com/byuoitav/terraform-kubernetes-nginx-ingress-controller
module "nginx-ingress-controller" {
  source  = "byuoitav/nginx-ingress-controller/kubernetes"
  version = "0.1.5"
}
#2. Se instala deployment asociado a la aplicacion mypythonapp
resource "kubernetes_deployment" "default" {
  metadata {
    name = "mypythonapp"
    labels = {
      app = "mypythonapp"
    }
  }
  spec {
    replicas = "${var.replicas}"
    selector {
      match_labels = {
        app = "mypythonapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "mypythonapp"
        }
      }

      spec {
        container {
          image = "gcr.io/jmpu-gcp/mypythonapp/python-rest:0.0.1"
          name  = "mypythonapp"
        }
      }
    }
  }
}
#3. Se configura service de la aplicacion mypythonapp
resource "kubernetes_service" "default" {
  metadata {
    name = "mypythonapp"
  }
  spec {
    selector = {
      app = "mypythonapp"
    }
    session_affinity = "ClientIP"
    port {
      port = 5000
      target_port = 5000
      name = "http"
    }
    type = "ClusterIP"
  }
}
#4. Se configura un ingress el cual publicara el apirest mypythonapp
resource "kubernetes_ingress" "default" {
  metadata {
    name = "mypythonapp"
  }

  spec {
    backend {
      service_name = "mypythonapp"
      service_port = 5000
    }

    rule {
      http {
        path {
          backend {
            service_name = "mypythonapp"
            service_port = 5000
          }

          path = "/greetings"
        }
		path {
          backend {
            service_name = "mypythonapp"
            service_port = 5000
          }

          path = "/square"
        }
      }
    }
  }
}
