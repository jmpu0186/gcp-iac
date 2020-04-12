variable "name" {
  default = "cluster-jmpu"
}

variable "project_name" {
  default = "jmpu-gcp"
}

variable "location" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "initial_node_count" {
  default = 1
}

variable "machine_type" {
  default = "n1-standard-1"  
}
