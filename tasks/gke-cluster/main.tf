provider "google" {
  credentials = file("../../credentials.json")
  project = "${var.project_name}"
  region  = "${var.location}"
  zone    = "${var.zone}"
}

resource "google_container_cluster" "default" {
  name        = "${var.name}"
  project     = "${var.project_name}"
  description = "Demo GKE Cluster"
  location    = "${var.location}"

  remove_default_node_pool = true
  initial_node_count = "${var.initial_node_count}"

  master_auth {
    username = ""
    password = ""
    client_certificate_config {
       issue_client_certificate = true
     }
  }
}

resource "google_container_node_pool" "default" {
  name       = "${var.name}-node-pool"
  project     = "${var.project_name}"
  location   = "${var.location}"
  cluster    = "${google_container_cluster.default.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

data "google_client_config" "current" {}

provider "kubernetes" {
  load_config_file = "false"
  host = "https://${google_container_cluster.default.endpoint}"
  cluster_ca_certificate = "${base64decode(google_container_cluster.default.master_auth.0.cluster_ca_certificate)}"
  token = "${data.google_client_config.current.access_token}"
}

module "k8s-config" {
  source = "./k8s-config"
}