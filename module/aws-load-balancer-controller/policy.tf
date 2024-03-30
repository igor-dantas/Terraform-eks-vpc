resource "aws_iam_policy" "eks_controller_policy" {
  name = "${var.project_name}-aws-load-balancer-controller"

  policy = file("${path.module}/iam_policy.json")
}