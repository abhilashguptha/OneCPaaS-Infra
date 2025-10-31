resource "aws_iam_user" "user" {
  name = var.user_name
}

resource "aws_iam_policy" "assume_role_policy" {
  name        = "${var.user_name}-assume-${var.role_name}"
  description = "Allow ${var.user_name} to assume ${var.role_name}"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRole",
        Resource = var.role_arn
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_assume_role_policy" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.assume_role_policy.arn
}