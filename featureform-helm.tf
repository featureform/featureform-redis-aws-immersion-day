resource "helm_release" "featureform" {
  name = "featureform"
  repository = "https://storage.googleapis.com/featureform-helm"
  chart = "featureform"
  set {
    name = "global.publicCert"
    value = "true"
  }
  set {
    name = "global.localCert"
    value = "false"
  }
  set {
    name = "global.hostname"
    value = local.domain
    type = "string"
  }
}

resource "helm_release" "featureform_quickstart" {
  name = "featureform-quickstart"
  repository = "https://storage.googleapis.com/featureform-helm/"
  chart = "quickstart"
}
