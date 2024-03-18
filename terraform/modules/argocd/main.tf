
# Create a namespace for Sealed Secrets
resource "kubernetes_namespace" "sealed_secrets" {
  metadata {
    name = "sealed-secrets"
  }
}

# Install Sealed Secrets using Helm
resource "helm_release" "sealed_secrets" {
  name       = "sealed-secrets"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets"
  namespace  = kubernetes_namespace.sealed_secrets.metadata.0.name
  version    = "2.7.1"

  # Customize Sealed Secrets deployment using Helm values
  set {
    name  = "secretName"
    value = "sealed-secrets-key"
  }
}



