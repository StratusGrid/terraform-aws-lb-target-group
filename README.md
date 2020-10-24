# lb-target-group
lb-target-group creates a target group with a random name appended to the end with the proper lifecycle rules to be able to be replaced.

### Example Usage:
```
module "lb-target-group" {
  source  = "StratusGrid/lb-target-group/aws"
  version = "1.1.0"
  # source  = "github.com/StratusGrid/terraform-aws-lb-target-group"

  vpc_id = module.vpc_microservices.vpc_id

  target_group_name_prefix     = "${var.name_prefix}-app-green${local.name_suffix}"
  target_group_type            = "ip"
  target_group_port            = 443
  target_group_protocol        = "HTTPS"
  target_group_health_interval = 10
  target_group_health_path     = "/"
  target_group_health_response = 200

  stickiness = {
    type = "lb_cookie"
    cookie_duration = 21600
    enabled = true
  }

  input_tags = merge(local.common_tags, {})
}
```
