provider "google" {
  credentials = file("C:/Users/oyin/Desktop/practice/service.json")
  project     = var.project_id
  region      = var.region
}

#data "google_client_config" "default" {}



data "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region
  project  = var.project_id
}
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${var.kubernetes_cluster_host}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = "https://${var.kubernetes_cluster_host}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
  }
}

resource "helm_release" "argo" {
  name = "argocd"

  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true
  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }
}
