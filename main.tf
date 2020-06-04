resource "random_id" "this" {
  keepers = {
    name = var.target_group_name_prefix
    port = var.target_group_port
    protocol = var.target_group_protocol
    vpc_id = var.vpc_id
    target_type = var.target_group_type
  }
  byte_length = 2
}


resource "aws_lb_target_group" "this" {
  name     = "${var.target_group_name_prefix}-${random_id.this.hex}"
  port     = var.target_group_port
  protocol = var.target_group_protocol
  vpc_id   = var.vpc_id

  target_type = var.target_group_type
  health_check {
    enabled  = true
    protocol = var.target_group_protocol
    path     = var.target_group_health_path
    interval = var.target_group_health_interval
    matcher  = var.target_group_health_response
  }

  tags = merge(var.input_tags, {})

  lifecycle {
    create_before_destroy = true
  }
}