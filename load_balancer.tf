#
# Create Load balancer security group and rules
#
resource "aws_security_group" "sg_lb" {
  name   = format("%s-load-balancer", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.main.cidr_block]
  }

}

resource "aws_security_group_rule" "internet_ingress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.sg_lb.id
  type              = "ingress"
}

resource "aws_security_group_rule" "secure_ingress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.sg_lb.id
  type              = "ingress"
}

#
# Create Load Balancer
#
resource "aws_lb" "main" {
  name               = format("%s-lb", var.project_name)
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [
    data.aws_ssm_parameter.subnet_public_1a.value,
    data.aws_ssm_parameter.subnet_public_1b.value,
    data.aws_ssm_parameter.subnet_public_1c.value
  ]

  security_groups = [aws_security_group.sg_lb.id]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Linuxtips"
      status_code  = "200"
    }
  }
}
