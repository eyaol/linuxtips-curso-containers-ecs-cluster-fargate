#
# Create ON DEMAND launch template
#
resource "aws_launch_template" "on_demand" {
  name_prefix            = format("%s-on-demand", var.project_name)
  image_id               = var.nodes_ami
  vpc_security_group_ids = [aws_security_group.main.id]
  update_default_version = true

  iam_instance_profile {
    name = var.instance_profile_name
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.node_volume_size
      volume_type = var.node_volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-on-demand", var.project_name)
    }
  }

  instance_type = var.node_instance_type

  user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    CLUSTER_NAME = var.project_name
  }))
}

#
# Create SPOT launch template
#
resource "aws_launch_template" "spot" {
  name_prefix            = format("%s-spot", var.project_name)
  image_id               = var.nodes_ami
  vpc_security_group_ids = [aws_security_group.main.id]
  update_default_version = true

  iam_instance_profile {
    name = var.instance_profile_name
  }

  instance_market_options {
    market_type = "spot"
    spot_options {
      max_price = "0.10"
    }
  }

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.node_volume_size
      volume_type = var.node_volume_type
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = format("%s-spot", var.project_name)
    }
  }

  instance_type = var.node_instance_type

  user_data = base64encode(templatefile("${path.module}/templates/user-data.tpl", {
    CLUSTER_NAME = var.project_name
  }))
}