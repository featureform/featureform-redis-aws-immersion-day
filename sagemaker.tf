resource "aws_sagemaker_notebook_instance" "ni" {
  name = "featureform-notebook"
  role_arn = aws_iam_role.notebook.arn
  instance_type = "ml.t2.medium"
}

# EKS Node IAM Role
resource "aws_iam_role" "notebook" {
  name = "${var.project}-Notebook-Role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "sagemaker.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "notebook_AmazonSageMakerFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
  role       = aws_iam_role.notebook.name
}
