<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.regional_external_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project) | resource |
| [google_storage_bucket.state](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | If a default network is to be created. True or False | `any` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The billing account ID for this project | `any` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket. | `any` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The GCP Seeding project ID | `string` | `""` | no |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region | `string` | `"us-central1"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The human readable project name (min 4 letters) | `any` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Bucket storage class | `string` | `"MULTI_REGIONAL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_addresses"></a> [addresses](#output\_addresses) | Global IPv4 address for proxy load balancing to the nearest Ingress controller |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | n/a |
| <a name="output_id"></a> [id](#output\_id) | GCP project ID |
| <a name="output_name"></a> [name](#output\_name) | Static IP Name |
| <a name="output_number"></a> [number](#output\_number) | GCP project number |
<!-- END_TF_DOCS -->