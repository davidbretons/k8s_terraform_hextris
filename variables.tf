# variables.tf

variable "kind_cluster_name" {
  type        = string
  description = ""
  default     = "cluster-local"
}

variable "kind_cluster_config_path" {
  type        = string
  description = ""
  default     = "~/.kube/config"
}

variable "ingress_nginx_helm_version" {
  type        = string
  description = "Ingress controller for Kubernetes using NGINX as a reverse proxy and load balancer"
  default     = "4.4.0"
}

variable "ingress_nginx_namespace" {
  type        = string
  description = ""
  default     = "ingress-nginx"
}
