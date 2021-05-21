resource "random_id" "this" {
  keepers = {
    name        = var.target_group_name_prefix
    port        = var.target_group_port
    protocol    = var.target_group_protocol
    vpc_id      = var.vpc_id
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
    enabled             = true
    protocol            = coalesce(var.target_group_health_protocol, var.target_group_protocol)
    path                = var.target_group_health_path
    interval            = var.target_group_health_interval
    matcher             = var.target_group_health_response
    port                = var.target_group_health_port
    timeout             = var.target_group_health_timeout
    healthy_threshold   = var.target_group_hc_healthy_threshold
    unhealthy_threshold = var.target_group_hc_unhealthy_threshold
  }

  dynamic "stickiness" {
    for_each = compact([lookup(var.stickiness, "type", "")]) # type is a required value. If not present, don't set stickiness
    content {
      type            = lookup(var.stickiness, "type", "")
      cookie_duration = lookup(var.stickiness, "cookie_duration", "")
      enabled         = lookup(var.stickiness, "enabled", "")
    }
  }

  tags = merge(local.common_tags, {})

  lifecycle {
    create_before_destroy = true
  }
}