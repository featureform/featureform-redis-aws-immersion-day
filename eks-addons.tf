resource "aws_eks_addon" "ebs-csi" {
	cluster_name = aws_eks_cluster.this.id
	addon_name = "aws-ebs-csi-driver"
	addon_version = "v1.21.0-eksbuild.1"
	resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "vpc-cni" {
	cluster_name = aws_eks_cluster.this.id
	addon_name = "vpc-cni"
	addon_version = "v1.11.4-eksbuild.1"
	resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "coredns" {
	cluster_name = aws_eks_cluster.this.id
	addon_name = "coredns"
	addon_version = "v1.8.7-eksbuild.3"
	resolve_conflicts = "OVERWRITE"
}

resource "aws_eks_addon" "kube-proxy" {
	cluster_name = aws_eks_cluster.this.id
	addon_name = "kube-proxy"
	addon_version = "v1.24.7-eksbuild.2"
	resolve_conflicts = "OVERWRITE"
}
