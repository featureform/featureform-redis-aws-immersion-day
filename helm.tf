resource "helm_release" "certmgr" {
  name = "certmgr"
  repository = "https://charts.jetstack.io"
  version = "v1.8.0"
  chart = "cert-manager"
  namespace = "cert-manager"
  create_namespace = true
  set {
    name = "installCRDs"
    value = "true"
  }
}
