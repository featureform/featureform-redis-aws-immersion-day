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
  depends_on = [
    helm_release.certmgr,
    aws_eks_addon.ebs-csi,
    aws_eks_addon.vpc-cni,
    aws_eks_addon.coredns,
    aws_eks_addon.kube-proxy,
    aws_eks_cluster.this,
    aws_internet_gateway.this,
    null_resource.merge_kubeconfig,
  ]
}

resource "helm_release" "featureform_quickstart" {
  name = "featureform-quickstart"
  repository = "https://storage.googleapis.com/featureform-helm/"
  chart = "quickstart"
  depends_on = [
    aws_eks_addon.ebs-csi,
    aws_eks_addon.vpc-cni,
    aws_eks_addon.coredns,
    aws_eks_addon.kube-proxy,
    aws_eks_cluster.this,
    null_resource.merge_kubeconfig,
  ]
}
