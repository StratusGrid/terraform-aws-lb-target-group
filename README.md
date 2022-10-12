<!-- BEGIN_TF_DOCS -->
# terraform-aws-lb-target-group

GitHub: [StratusGrid/terraform-aws-lb-target-group](https://github.com/StratusGrid/terraform-aws-lb-target-group)

This module creates a target group with a random name appended to the end with the proper lifecycle rules able to be replaced.

## Example:
```hcl
module "lb-target-group" {
  source  = "StratusGrid/lb-target-group/aws"
  version = "1.2.0"
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
---

## Resources

| Name | Type |
|------|------|
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [random_id.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_input_tags"></a> [input\_tags](#input\_input\_tags) | Map of tags to apply to resources | `map(string)` | <pre>{<br>  "Developer": "StratusGrid",<br>  "Provisioner": "Terraform"<br>}</pre> | no |
| <a name="input_stickiness"></a> [stickiness](#input\_stickiness) | Stickiness configuration block to use | `map(string)` | `{}` | no |
| <a name="input_target_group_hc_healthy_threshold"></a> [target\_group\_hc\_healthy\_threshold](#input\_target\_group\_hc\_healthy\_threshold) | Number of consecutive health checks successes required before considering an unhealthy target healthy. Default is 3 | `number` | `3` | no |
| <a name="input_target_group_hc_unhealthy_threshold"></a> [target\_group\_hc\_unhealthy\_threshold](#input\_target\_group\_hc\_unhealthy\_threshold) | Number of consecutive health check failures required before considering the target unhealthy. Default is 3 | `number` | `3` | no |
| <a name="input_target_group_health_interval"></a> [target\_group\_health\_interval](#input\_target\_group\_health\_interval) | Interval for health checks | `number` | `10` | no |
| <a name="input_target_group_health_path"></a> [target\_group\_health\_path](#input\_target\_group\_health\_path) | Path for health checks | `string` | `"/"` | no |
| <a name="input_target_group_health_port"></a> [target\_group\_health\_port](#input\_target\_group\_health\_port) | Override port for health check, otherwise this will be traffic port. | `string` | `"traffic-port"` | no |
| <a name="input_target_group_health_protocol"></a> [target\_group\_health\_protocol](#input\_target\_group\_health\_protocol) | Override protocol for health check, otherwise this will match traffic protocol | `string` | `""` | no |
| <a name="input_target_group_health_response"></a> [target\_group\_health\_response](#input\_target\_group\_health\_response) | Response code for health indicator. Can be single, comma separated, or ranges. Default is 200 | `string` | `200` | no |
| <a name="input_target_group_health_timeout"></a> [target\_group\_health\_timeout](#input\_target\_group\_health\_timeout) | Override timeout for health check for health check, otherwise this will be one second. | `number` | `5` | no |
| <a name="input_target_group_name_prefix"></a> [target\_group\_name\_prefix](#input\_target\_group\_name\_prefix) | name prefix (pre-random) of target group to be created | `string` | n/a | yes |
| <a name="input_target_group_port"></a> [target\_group\_port](#input\_target\_group\_port) | Port configuration for LB Target group | `number` | `443` | no |
| <a name="input_target_group_protocol"></a> [target\_group\_protocol](#input\_target\_group\_protocol) | Protocol configuration for LB Target group | `string` | `"HTTPS"` | no |
| <a name="input_target_group_type"></a> [target\_group\_type](#input\_target\_group\_type) | Target type (ip/instance, lambda is not supported by this module) | `string` | `"ip"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of VPC which the resource should be created in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | ARN of target group created by module. |
| <a name="output_target_group_id"></a> [target\_group\_id](#output\_target\_group\_id) | ID of target group created by module. |
| <a name="output_target_group_name"></a> [target\_group\_name](#output\_target\_group\_name) | Name of target group created by module. |
| <a name="output_target_group_port"></a> [target\_group\_port](#output\_target\_group\_port) | Destination port of the targets of target group created by module. |

---

<span style="color:red">Note:</span> Manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->