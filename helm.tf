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
  depends_on = [
    aws_eks_addon.ebs-csi,
    aws_eks_addon.vpc-cni,
    aws_eks_addon.coredns,
    aws_eks_addon.kube-proxy,
    aws_eks_cluster.this,
    null_resource.merge_kubeconfig,
  ]
}
