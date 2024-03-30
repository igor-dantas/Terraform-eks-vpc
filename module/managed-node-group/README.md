<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.43.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.12.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.27.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks\_cluster](#module\_eks\_cluster) | ./module/cluster | n/a |
| <a name="module_eks_load_balancer_controller"></a> [eks\_load\_balancer\_controller](#module\_eks\_load\_balancer\_controller) | ./module/aws-load-balancer-controller | n/a |
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | ./module/managed-node-group | n/a |
| <a name="module_eks_network"></a> [eks\_network](#module\_eks\_network) | ./module/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Cidr block to be used for the vpc | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name to be used to name the resources | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region of the project you want to use | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | map of tags to add on all aws resources | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca"></a> [ca](#output\_ca) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_oidc"></a> [oidc](#output\_oidc) | n/a |
<!-- END_TF_DOCS -->