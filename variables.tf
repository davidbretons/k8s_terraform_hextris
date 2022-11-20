# variables.tf

variable "kind_cluster_name" {
  type        = string
  description = "Name of the cluster"
  #default     = "cluster-local"
}

variable "kind_cluster_config_path" {
  type        = string
  description = "Path to use for the kubeconfig"
#  default     = "~/.kube/config"
}

variable "ingress_nginx_helm_version" {
  type        = string
  description = "Helm version for the ingress controller"
}

variable "ingress_nginx_namespace" {
  type        = string
  description = "NGIX Ingress namespace"
}
