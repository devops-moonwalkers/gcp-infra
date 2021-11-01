<!-- BEGIN_TF_DOCS -->

![diagram](diagram.png)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 3.70.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 3.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 3.70.0 |
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | 3.70.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google-beta_google_container_cluster.primary_cluster](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_cluster) | resource |
| [google-beta_google_container_node_pool.preemptible-node_pool](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_container_node_pool) | resource |
| [google_compute_address.regional_external_ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_firewall.ssh-rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.gke_net_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.gke_cloud_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.gke_private_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_project_service.compute](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.gke_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | n/a | `string` | `"false"` | no |
| <a name="input_disable_http_load_balancing"></a> [disable\_http\_load\_balancing](#input\_disable\_http\_load\_balancing) | Enable HTTP Load balancing GCP integration | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | gke specific | `string` | `"true"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"dev"` | no |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The newly created GCP project ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region | `string` | `"us-central1"` | no |
| <a name="input_gke_pool_disk_size_gb"></a> [gke\_pool\_disk\_size\_gb](#input\_gke\_pool\_disk\_size\_gb) | n/a | `string` | `"100"` | no |
| <a name="input_gke_pool_disk_type"></a> [gke\_pool\_disk\_type](#input\_gke\_pool\_disk\_type) | n/a | `string` | `"pd-standard"` | no |
| <a name="input_gke_pool_image_type"></a> [gke\_pool\_image\_type](#input\_gke\_pool\_image\_type) | n/a | `string` | `"COS"` | no |
| <a name="input_gke_pool_machine_type"></a> [gke\_pool\_machine\_type](#input\_gke\_pool\_machine\_type) | n/a | `string` | `"e2-small"` | no |
| <a name="input_gke_pool_node_count"></a> [gke\_pool\_node\_count](#input\_gke\_pool\_node\_count) | pool specifc | `string` | `"1"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.20.10-gke.1600"` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | n/a | `string` | `"172.16.0.0/28"` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The GCP monitoring service scope | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | variables used to create VPC | `string` | `"10.128.1.0/26"` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `true` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | `string` | `"ycit021"` | no |
| <a name="input_pods_cidr"></a> [pods\_cidr](#input\_pods\_cidr) | n/a | `string` | `"172.0.0.0/18"` | no |
| <a name="input_pods_cidr_name"></a> [pods\_cidr\_name](#input\_pods\_cidr\_name) | n/a | `string` | `"pods"` | no |
| <a name="input_pods_range_name"></a> [pods\_range\_name](#input\_pods\_range\_name) | n/a | `string` | `"pods"` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | `"project"` | no |
| <a name="input_services_cidr"></a> [services\_cidr](#input\_services\_cidr) | n/a | `string` | `"172.10.0.0/21"` | no |
| <a name="input_services_cidr_name"></a> [services\_cidr\_name](#input\_services\_cidr\_name) | n/a | `string` | `"services"` | no |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | n/a | `string` | `"services"` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | n/a | `string` | `"Standard"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | n/a |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_subnet_selflink"></a> [subnet\_selflink](#output\_subnet\_selflink) | n/a |
| <a name="output_vpc_name"></a> [vpc\_name](#output\_vpc\_name) | n/a |
| <a name="output_vpc_selflink"></a> [vpc\_selflink](#output\_vpc\_selflink) | n/a |
<!-- END_TF_DOCS -->
