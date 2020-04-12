output "endpoint" {
  value = "${google_container_cluster.default.endpoint}"
}

output "master_version" {
  value = "${google_container_cluster.default.master_version}"
}

#output "lb_address" {
#  value       = "${nginx-ingress-controller.kubernetes_service.lb.load_balancer_ingress[0].ip}"
#  description = "The hostname of the LB created by kubernetes"
#}

#output "cluster_ca_certificate" {
#  description = "Public certificate that is the root of trust for the cluster"
#  value       = "${base64decode(google_container_cluster.default.master_auth.0.cluster_ca_certificate)}"
#}

#output "client_key" {
#  description = "Private key used by clients to authenticate to the cluster endpoint"
#  value       = "${base64decode(google_container_cluster.default.master_auth.0.client_key)}"
#}

#output "client_certificate" {
#  description = "Public certificate used by clients to authenticate to the cluster endpoint"
#  value       = "${base64decode(google_container_cluster.default.master_auth.0.client_certificate)}"
#}
