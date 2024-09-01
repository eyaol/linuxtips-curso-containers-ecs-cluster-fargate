#
# Create ECS Role
#
resource "aws_iam_role" "ecs_role" {
  name = "ecsCustomRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "ecsCustomRole"
  }
}

#
# Attach aws managed policies
#
resource "aws_iam_role_policy_attachment" "ec2_container_service_policy" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}
resource "aws_iam_role_policy_attachment" "ec2_ssm_policy" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
resource "aws_iam_role_policy_attachment" "ssm_full_access_policy" {
  role       = aws_iam_role.ecs_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}


#
# Create instance profile
#
resource "aws_iam_instance_profile" "main" {
  name = var.instance_profile_name
  role = aws_iam_role.ecs_role.name

  depends_on = [aws_iam_role.ecs_role]
}