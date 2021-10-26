# terraform-docs

[![Build Status](https://github.com/terraform-docs/terraform-docs/workflows/ci/badge.svg)](https://github.com/terraform-docs/terraform-docs/actions) [![GoDoc](https://pkg.go.dev/badge/github.com/terraform-docs/terraform-docs)](https://pkg.go.dev/github.com/terraform-docs/terraform-docs) [![Go Report Card](https://goreportcard.com/badge/github.com/terraform-docs/terraform-docs)](https://goreportcard.com/report/github.com/terraform-docs/terraform-docs) [![Codecov Report](https://codecov.io/gh/terraform-docs/terraform-docs/branch/master/graph/badge.svg)](https://codecov.io/gh/terraform-docs/terraform-docs) [![License](https://img.shields.io/github/license/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/blob/master/LICENSE) [![Latest release](https://img.shields.io/github/v/release/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/releases)

![terraform-docs-teaser](./images/terraform-docs-teaser.png)

Sponsored by [Scalr - Terraform Automation & Collaboration Software](https://scalr.com/?utm_source=terraform-docs)

<a href="https://www.scalr.com/?utm_source=terraform-docs" target="_blank"><img src="https://bit.ly/2T7Qm3U" alt="Scalr - Terraform Automation & Collaboration Software" width="175" height="40" /></a>

## What is terraform-docs

A utility to generate documentation from Terraform modules in various output formats.

## Installation

macOS users can install using [Homebrew]:

```bash
brew install terraform-docs
```

or

```bash
brew install terraform-docs/tap/terraform-docs
```

Windows users can install using [Scoop]:

```bash
scoop bucket add terraform-docs https://github.com/terraform-docs/scoop-bucket
scoop install terraform-docs
```

or [Chocolatey]:

```bash
choco install terraform-docs
```

Stable binaries are also available on the [releases] page. To install, download the
binary for your platform from "Assets" and place this into your `$PATH`:

```bash
curl -Lo ./terraform-docs.tar.gz https://github.com/terraform-docs/terraform-docs/releases/download/v0.16.0/terraform-docs-v0.16.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
chmod +x terraform-docs
mv terraform-docs /usr/local/terraform-docs
```

**NOTE:** Windows releases are in `ZIP` format.

The latest version can be installed using `go install` or `go get`:

```bash
# go1.17+
go install github.com/terraform-docs/terraform-docs@v0.16.0
```

```bash
# go1.16
GO111MODULE="on" go get github.com/terraform-docs/terraform-docs@v0.16.0
```

**NOTE:** please use the latest Go to do this, minimum `go1.16` is required.

This will put `terraform-docs` in `$(go env GOPATH)/bin`. If you encounter the error
`terraform-docs: command not found` after installation then you may need to either add
that directory to your `$PATH` as shown [here] or do a manual installation by cloning
the repo and run `make build` from the repository which will put `terraform-docs` in:

```bash
$(go env GOPATH)/src/github.com/terraform-docs/terraform-docs/bin/$(uname | tr '[:upper:]' '[:lower:]')-amd64/terraform-docs
```

## Usage

### Running the binary directly

To run and generate documentation into README within a directory:

```bash
terraform-docs markdown table --output-file README.md --output-mode inject /path/to/module
```

Check [`output`] configuration for more details and examples.

### Using docker

terraform-docs can be run as a container by mounting a directory with `.tf`
files in it and run the following command:

```bash
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs
```

If `output.file` is not enabled for this module, generated output can be redirected
back to a file:

```bash
docker run --rm --volume "$(pwd):/terraform-docs" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs > doc.md
```

**NOTE:** Docker tag `latest` refers to _latest_ stable released version and `edge`
refers to HEAD of `master` at any given point in time.

### Using GitHub Actions

To use terraform-docs GitHub Action, configure a YAML workflow file (e.g.
`.github/workflows/documentation.yml`) with the following:

```yaml
name: Generate terraform docs
on:
  - pull_request

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        ref: ${{ github.event.pull_request.head.ref }}

    - name: Render terraform docs and push changes back to PR
      uses: terraform-docs/gh-actions@main
      with:
        working-dir: .
        output-file: README.md
        output-method: inject
        git-push: "true"
```

Read more about [terraform-docs GitHub Action] and its configuration and
examples.

### pre-commit hook

With pre-commit, you can ensure your Terraform module documentation is kept
up-to-date each time you make a commit.

First [install pre-commit] and then create or update a `.pre-commit-config.yaml`
in the root of your Git repo with at least the following content:

```yaml
repos:
  - repo: https://github.com/terraform-docs/terraform-docs
    rev: "v0.16.0"
    hooks:
      - id: terraform-docs-go
        args: ["markdown", "table", "--output-file", "README.md", "./mymodule/path"]
```

Then run:

```bash
pre-commit install
pre-commit install-hooks
```

Further changes to your module's `.tf` files will cause an update to documentation
when you make a commit.

## Configuration

terraform-docs can be configured with a yaml file. The default name of this file is
`.terraform-docs.yml` and the path order for locating it is:

1. root of module directory
1. `.config/` folder at root of module directory
1. current directory
1. `.config/` folder at current directory
1. `$HOME/.tfdocs.d/`

```yaml
formatter: "" # this is required

version: ""

header-from: main.tf
footer-from: ""

recursive:
  enabled: false
  path: modules

sections:
  hide: []
  show: []

content: ""

output:
  file: ""
  mode: inject
  template: |-
    <!-- BEGIN_TF_DOCS -->
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
| <a name="input_auto_create_network"></a> [auto\_create\_network](#input\_auto\_create\_network) | n/a | `string` | n/a | yes |
| <a name="input_billing_account"></a> [billing\_account](#input\_billing\_account) | The GCP billing account | `string` | n/a | yes |
| <a name="input_disable_http_load_balancing"></a> [disable\_http\_load\_balancing](#input\_disable\_http\_load\_balancing) | Enable HTTP Load balancing GCP integration | `bool` | `false` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | When true, the cluster's private endpoint is used as the cluster endpoint and access through the public endpoint is disabled. | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | Enable Private-IP Only GKE Nodes | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_gcp_project_id"></a> [gcp\_project\_id](#input\_gcp\_project\_id) | The newly created GCP project ID | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | The GCP Region | `string` | `"us-central1"` | no |
| <a name="input_gke_pool_disk_size_gb"></a> [gke\_pool\_disk\_size\_gb](#input\_gke\_pool\_disk\_size\_gb) | n/a | `string` | n/a | yes |
| <a name="input_gke_pool_disk_type"></a> [gke\_pool\_disk\_type](#input\_gke\_pool\_disk\_type) | n/a | `string` | `"pd-standard"` | no |
| <a name="input_gke_pool_image_type"></a> [gke\_pool\_image\_type](#input\_gke\_pool\_image\_type) | n/a | `string` | n/a | yes |
| <a name="input_gke_pool_machine_type"></a> [gke\_pool\_machine\_type](#input\_gke\_pool\_machine\_type) | Node Pool specific variables | `string` | n/a | yes |
| <a name="input_gke_pool_node_count"></a> [gke\_pool\_node\_count](#input\_gke\_pool\_node\_count) | n/a | `number` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The GKE version of Kubernetes | `string` | `""` | no |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The ipv4 cidr block that the GKE masters use | `any` | n/a | yes |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The GCP monitoring service scope | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `true` | no |
| <a name="input_org"></a> [org](#input\_org) | n/a | `string` | n/a | yes |
| <a name="input_pods_cidr"></a> [pods\_cidr](#input\_pods\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_pods_cidr_name"></a> [pods\_cidr\_name](#input\_pods\_cidr\_name) | n/a | `string` | n/a | yes |
| <a name="input_pods_range_name"></a> [pods\_range\_name](#input\_pods\_range\_name) | The pre-defined IP Range the Cluster should use to provide IP addresses to pods | `string` | `""` | no |
| <a name="input_product"></a> [product](#input\_product) | n/a | `string` | n/a | yes |
| <a name="input_services_cidr"></a> [services\_cidr](#input\_services\_cidr) | n/a | `string` | n/a | yes |
| <a name="input_services_cidr_name"></a> [services\_cidr\_name](#input\_services\_cidr\_name) | n/a | `string` | n/a | yes |
| <a name="input_services_range_name"></a> [services\_range\_name](#input\_services\_range\_name) | The pre-defined IP Range the Cluster should use to provide IP addresses to services | `string` | `""` | no |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | n/a | `string` | n/a | yes |

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

output-values:
  enabled: false
  from: ""

sort:
  enabled: true
  by: name

settings:
  anchor: true
  color: true
  default: true
  description: false
  escape: true
  hide-empty: false
  html: true
  indent: 2
  lockfile: true
  read-comments: true
  required: true
  sensitive: true
  type: true
```

## Content Template

Generated content can be customized further away with `content` in configuration.
If the `content` is empty the default order of sections is used.

Compatible formatters for customized content are `asciidoc` and `markdown`. `content`
will be ignored for other formatters.

`content` is a Go template with following additional variables:

- `{{ .Header }}`
- `{{ .Footer }}`
- `{{ .Inputs }}`
- `{{ .Modules }}`
- `{{ .Outputs }}`
- `{{ .Providers }}`
- `{{ .Requirements }}`
- `{{ .Resources }}`

and following functions:

- `{{ include "relative/path/to/file" }}`

These variables are the generated output of individual sections in the selected
formatter. For example `{{ .Inputs }}` is Markdown Table representation of _inputs_
when formatter is set to `markdown table`.

Note that sections visibility (i.e. `sections.show` and `sections.hide`) takes
precedence over the `content`.

Additionally there's also one extra special variable avaialble to the `content`:

- `{{ .Module }}`

As opposed to the other variables mentioned above, which are generated sections
based on a selected formatter, the `{{ .Module }}` variable is just a `struct`
representing a [Terraform module].

````yaml
content: |-
  Any arbitrary text can be placed anywhere in the content

  {{ .Header }}

  and even in between sections

  {{ .Providers }}

  and they don't even need to be in the default order

  {{ .Outputs }}

  include any relative files

  {{ include "relative/path/to/file" }}

  {{ .Inputs }}

  # Examples

  ```hcl
  {{ include "examples/foo/main.tf" }}
  ```

  ## Resources

  {{ range .Module.Resources }}
  - {{ .GetMode }}.{{ .Spec }} ({{ .Position.Filename }}#{{ .Position.Line }})
  {{- end }}
````

## Build on top of terraform-docs

terraform-docs primary use-case is to be utilized as a standalone binary, but
some parts of it is also available publicly and can be imported in your project
as a library.

```go
import (
    "github.com/terraform-docs/terraform-docs/format"
    "github.com/terraform-docs/terraform-docs/print"
    "github.com/terraform-docs/terraform-docs/terraform"
)

// buildTerraformDocs for module root `path` and provided content `tmpl`.
func buildTerraformDocs(path string, tmpl string) (string, error) {
    config := print.DefaultConfig()
    config.ModuleRoot = path // module root path (can be relative or absolute)

    module, err := terraform.LoadWithOptions(config)
    if err != nil {
        return "", err
    }

    // Generate in Markdown Table format
    formatter := format.NewMarkdownTable(config)

    if err := formatter.Generate(module); err != nil {
        return "", err
    }

    // // Note: if you don't intend to provide additional template for the generated
    // // content, or the target format doesn't provide templating (e.g. json, yaml,
    // // xml, or toml) you can use `Content()` function instead of `Render()`.
    // // `Content()` returns all the sections combined with predefined order.
    // return formatter.Content(), nil

    return formatter.Render(tmpl)
}
```

## Plugin

Generated output can be heavily customized with [`content`], but if using that
is not enough for your use-case, you can write your own plugin.

In order to install a plugin the following steps are needed:

- download the plugin and place it in `~/.tfdocs.d/plugins` (or `./.tfdocs.d/plugins`)
- make sure the plugin file name is `tfdocs-format-<NAME>`
- modify [`formatter`] of `.terraform-docs.yml` file to be `<NAME>`

**Important notes:**

- if the plugin file name is different than the example above, terraform-docs won't
be able to to pick it up nor register it properly
- you can only use plugin thorough `.terraform-docs.yml` file and it cannot be used
with CLI arguments

To create a new plugin create a new repository called `tfdocs-format-<NAME>` with
following `main.go`:

```go
package main

import (
    _ "embed" //nolint

    "github.com/terraform-docs/terraform-docs/plugin"
    "github.com/terraform-docs/terraform-docs/print"
    "github.com/terraform-docs/terraform-docs/template"
    "github.com/terraform-docs/terraform-docs/terraform"
)

func main() {
    plugin.Serve(&plugin.ServeOpts{
        Name:    "<NAME>",
        Version: "0.1.0",
        Printer: printerFunc,
    })
}

//go:embed sections.tmpl
var tplCustom []byte

// printerFunc the function being executed by the plugin client.
func printerFunc(config *print.Config, module *terraform.Module) (string, error) {
    tpl := template.New(config,
        &template.Item{Name: "custom", Text: string(tplCustom)},
    )

    rendered, err := tpl.Render("custom", module)
    if err != nil {
        return "", err
    }

    return rendered, nil
}
```

Please refer to [tfdocs-format-template] for more details. You can create a new
repository from it by clicking on `Use this template` button.

## Documentation

- **Users**
  - Read the [User Guide] to learn how to use terraform-docs
  - Read the [Formats Guide] to learn about different output formats of terraform-docs
  - Refer to [Config File Reference] for all the available configuration options
- **Developers**
  - Read [Contributing Guide] before submitting a pull request

Visit [our website] for all documentation.

## Community

- Discuss terraform-docs on [Slack]

## License

MIT License - Copyright (c) 2021 The terraform-docs Authors.

[Chocolatey]: https://www.chocolatey.org
[Config File Reference]: https://terraform-docs.io/user-guide/configuration/
[`content`]: https://terraform-docs.io/user-guide/configuration/content/
[Contributing Guide]: CONTRIBUTING.md
[Formats Guide]: https://terraform-docs.io/reference/terraform-docs/
[`formatter`]: https://terraform-docs.io/user-guide/configuration/formatter/
[here]: https://golang.org/doc/code.html#GOPATH
[Homebrew]: https://brew.sh
[install pre-commit]: https://pre-commit.com/#install
[`output`]: https://terraform-docs.io/user-guide/configuration/output/
[releases]: https://github.com/terraform-docs/terraform-docs/releases
[Scoop]: https://scoop.sh/
[Slack]: https://slack.terraform-docs.io/
[terraform-docs GitHub Action]: https://github.com/terraform-docs/gh-actions
[Terraform module]: https://pkg.go.dev/github.com/terraform-docs/terraform-docs/terraform#Module
[tfdocs-format-template]: https://github.com/terraform-docs/tfdocs-format-template
[our website]: https://terraform-docs.io/
[User Guide]: https://terraform-docs.io/user-guide/introduction/
