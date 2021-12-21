<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_ip | ip of admin location | `string` | n/a | yes |
| allowed\_ip | ip address allowed to access | `string` | n/a | yes |
| centos\_8\_ami\_id | ami id for centos 8 | `string` | n/a | yes |
| ec2\_key\_name | Name of pre-existing ec2-key for access to instance | `string` | n/a | yes |
| instance\_size\_type | size of ec2 instances | `string` | n/a | yes |
| region | resource location | `string` | `"eu-west-1"` | no |
| ubuntu\_ami\_id | ami id for ubuntu | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| centos\_ec2\_arn | n/a |
| security\_group\_arn | n/a |
| ubuntu\_ec2\_arn | n/a |
| vpc\_id | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
