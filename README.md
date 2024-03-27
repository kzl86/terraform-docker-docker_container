<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.7.5 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | 3.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | 3.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.this](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | The command to use as the Entrypoint for the container. The Entrypoint allows you to configure a container to run as an executable. | `list(string)` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0 | `list(string)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | The ID of the image to back this container. The easiest way to get this value is to use the docker\_image resource as is shown in the example. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined key/value metadata | `map(any)` | `{}` | no |
| <a name="input_log_opts"></a> [log\_opts](#input\_log\_opts) | Key/value pairs to use as options for the logging driver. | `map(string)` | `{}` | no |
| <a name="input_mounts"></a> [mounts](#input\_mounts) | Specification for mounts to be added to containers created as part of the service. | `list(any)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the container. | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Network mode of the container. | `string` | `"default"` | no |
| <a name="input_networks_advanced"></a> [networks\_advanced](#input\_networks\_advanced) | The networks the container is attached to. | `list(any)` | `null` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | Publish a container's port(s) to the host. | `list(any)` | `null` | no |
| <a name="input_restart"></a> [restart](#input\_restart) | The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no. | `string` | `"no"` | no |
| <a name="input_ulimits"></a> [ulimits](#input\_ulimits) | Ulimit options to add. | `list(any)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->