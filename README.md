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
| <a name="input_attach"></a> [attach](#input\_attach) | If true attach to the container after its creation and waits the end of its execution. | `bool` | `false` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | Add or drop certrain linux capabilities.<br>{<br>  add = List of linux capabilities to add.<br>  drop = List of linux capabilities to drop.<br>} | <pre>object({<br>    add  = optional(set(string), [])<br>    drop = optional(set(string), [])<br>  })</pre> | `null` | no |
| <a name="input_cgroupns_mode"></a> [cgroupns\_mode](#input\_cgroupns\_mode) | Cgroup namespace mode to use for the container. Possible values are: private, host. | `string` | `null` | no |
| <a name="input_command"></a> [command](#input\_command) | The command to use to start the container. | `list(string)` | `null` | no |
| <a name="input_container_read_refresh_timeout_milliseconds"></a> [container\_read\_refresh\_timeout\_milliseconds](#input\_container\_read\_refresh\_timeout\_milliseconds) | The total number of milliseconds to wait for the container to reach status 'running' | `number` | `null` | no |
| <a name="input_cpu_set"></a> [cpu\_set](#input\_cpu\_set) | A comma-separated list or hyphen-separated range of CPUs a container can use, e.g. 0-1. | `string` | `null` | no |
| <a name="input_cpu_shares"></a> [cpu\_shares](#input\_cpu\_shares) | CPU shares (relative weight) for the container. | `number` | `null` | no |
| <a name="input_destroy_grace_seconds"></a> [destroy\_grace\_seconds](#input\_destroy\_grace\_seconds) | If defined will attempt to stop the container before destroying. Container will be destroyed after n seconds or on successful stop. | `number` | `null` | no |
| <a name="input_devices"></a> [devices](#input\_devices) | Bind devices to the container.<br>[{<br>    host\_path = The path on the host where the device is located.<br>    container\_path = The path in the container where the device will be bound.<br>    permissions = The cgroup permissions given to the container to access the device. Defaults to rwm.<br>}] | `list(any)` | `null` | no |
| <a name="input_dns"></a> [dns](#input\_dns) | DNS servers to use. | `set(string)` | `null` | no |
| <a name="input_dns_opts"></a> [dns\_opts](#input\_dns\_opts) | DNS options used by the DNS provider(s), see resolv.conf documentation for valid list of options. | `set(string)` | `null` | no |
| <a name="input_dns_search"></a> [dns\_search](#input\_dns\_search) | DNS search domains that are used when bare unqualified hostnames are used inside of the container. | `set(string)` | `null` | no |
| <a name="input_domainname"></a> [domainname](#input\_domainname) | Domain name of the container. | `string` | `null` | no |
| <a name="input_entrypoint"></a> [entrypoint](#input\_entrypoint) | The command to use as the Entrypoint for the container. The Entrypoint allows you to configure a container to run as an executable. | `list(string)` | `null` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0 | `list(string)` | `[]` | no |
| <a name="input_gpus"></a> [gpus](#input\_gpus) | GPU devices to add to the container. Currently, only the value all is supported. Passing any other value will result in unexpected behavior. | `string` | `null` | no |
| <a name="input_group_add"></a> [group\_add](#input\_group\_add) | Additional groups for the container user. | `set(string)` | `null` | no |
| <a name="input_healthcheck"></a> [healthcheck](#input\_healthcheck) | A test to perform to check that the container is healthy.<br>{<br>  test = Command to run to check health.<br>  interval = Time between running the check (ms\|s\|m\|h).<br>  retries = Consecutive failures needed to report unhealthy.<br>  start\_period = Start period for the container to initialize before counting retries towards unstable (ms\|s\|m\|h).<br>  timeout = Maximum time to allow one check to run (ms\|s\|m\|h).\n<br>} | <pre>object({<br>    test         = list(string)<br>    interval     = optional(string, "0s")<br>    retries      = optional(number, 0)<br>    start_period = optional(string, "0s")<br>    timeout      = optional(string, "0s")<br>  })</pre> | `null` | no |
| <a name="input_host"></a> [host](#input\_host) | Additional hosts to add to the container.<br>{<br>  host = Hostname to add<br>  ip = IP address this hostname should resolve to.<br>} | <pre>object({<br>    host = string<br>    ip   = string<br>  })</pre> | `null` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Hostname of the container. | `string` | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | The ID of the image to back this container. The easiest way to get this value is to use the docker\_image resource as is shown in the example. | `string` | n/a | yes |
| <a name="input_init"></a> [init](#input\_init) | Configured whether an init process should be injected for this container. If unset this will default to the dockerd defaults. | `bool` | `null` | no |
| <a name="input_ipc_mode"></a> [ipc\_mode](#input\_ipc\_mode) | IPC sharing mode for the container. Possible values are: none, private, shareable, container:<name\|id> or host. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | User-defined key/value metadata<br>[{<br>    label = Name of the label<br>    value = Value of the label<br>}] | `map(any)` | `{}` | no |
| <a name="input_log_driver"></a> [log\_driver](#input\_log\_driver) | The logging driver to use for the container. | `string` | `null` | no |
| <a name="input_log_opts"></a> [log\_opts](#input\_log\_opts) | Key/value pairs to use as options for the logging driver. | `map(string)` | `{}` | no |
| <a name="input_logs"></a> [logs](#input\_logs) | Save the container logs (attach must be enabled). | `bool` | `false` | no |
| <a name="input_max_retry_count"></a> [max\_retry\_count](#input\_max\_retry\_count) | The maximum amount of times to an attempt a restart when restart is set to 'on-failure'. | `number` | `null` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The memory limit for the container in MBs. | `number` | `null` | no |
| <a name="input_memory_swap"></a> [memory\_swap](#input\_memory\_swap) | The total memory limit (memory + swap) for the container in MBs. This setting may compute to -1 after terraform apply if the target host doesn't support memory swap, when that is the case docker will use a soft limitation. | `number` | `null` | no |
| <a name="input_mounts"></a> [mounts](#input\_mounts) | Specification for mounts to be added to containers created as part of the service.<br>[{<br>    target = Container path. (required)<br>    type = The mount type. (required)<br>    bind\_options = [{ # Optional configuration for the bind type. (maximum 1)<br>      propagation = A propagation mode with the value. (optional)<br>    }]<br>    read\_only = Whether the mount should be read-only. (optional)<br>    source = Mount source (e.g. a volume name, a host path). (optional)<br>    tmpfs\_options = [{ # Optional configuration for the tmpfs type. (maximum 1)<br>      mode       = The permission mode for the tmpfs mount in an integer. (optional)<br>      size\_bytes = The size for the tmpfs mount in bytes. (optional)<br>    }]<br>    volume\_options =[{ # Optional configuration for the volume type. (maximum 1)<br>      driver\_name    = Name of the driver to use to create the volume. (optional)<br>      driver\_options = key/value map of driver specific options. (optional)<br>      labels = [{ (optional)<br>        label = Name of the label (required)<br>        value = Value of the label (required)<br>      }]<br>      no\_copy = Populate volume with data from the target. (optional)<br>    }]<br>}] | <pre>list(object({<br>    target = string<br>    type   = string<br>    bind_options = optional(list(object({<br>      propagation = optional(string, null)<br>    })))<br>    read_only = optional(string, null)<br>    source    = optional(string, null)<br>    tmpfs_options = optional(list(object({<br>      mode       = optional(number, null)<br>      size_bytes = optional(number, null)<br>    })))<br>    volume_options = optional(list(object({<br>      driver_name    = optional(string, null)<br>      driver_options = optional(map(string), {})<br>      labels = optional(list(object({<br>        label = optional(string, null)<br>        value = optional(string, null)<br>      })))<br>      no_copy = optional(bool, null)<br>    })))<br>  }))</pre> | `null` | no |
| <a name="input_must_run"></a> [must\_run](#input\_must\_run) | If true, then the Docker container will be kept running. If false, then as long as the container exists, Terraform assumes it is successful. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the container. | `string` | n/a | yes |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | Network mode of the container. | `string` | `"default"` | no |
| <a name="input_networks_advanced"></a> [networks\_advanced](#input\_networks\_advanced) | The networks the container is attached to.<br>[{<br>  name         = The name or id of the network to use. You can use name or id attribute from a docker\_network resource. (required)<br>  aliases      = The network aliases of the container in the specific network. (optional)<br>  ipv4\_address = The IPV4 address of the container in the specific network. (optional)<br>  ipv6\_address = The IPV6 address of the container in the specific network. (optional)<br>}] | `list(any)` | `null` | no |
| <a name="input_pid_mode"></a> [pid\_mode](#input\_pid\_mode) | The PID (Process) Namespace mode for the container. Either container:<name\|id> or host. | `string` | `null` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | Publish a container's port(s) to the host.<br>[{<br>  internal = Port within the container. (required)<br>  external = Port exposed out of the container. If not given a free random port >= 32768 will be used. (optional)<br>  ip       = IP address/mask that can access this port. Defaults to 0.0.0.0. (optional)<br>  protocol = Protocol that can be used over this port. Defaults to tcp. (optional)<br>}] | `list(any)` | `null` | no |
| <a name="input_privileged"></a> [privileged](#input\_privileged) | If true, the container runs in privileged mode. | `bool` | `false` | no |
| <a name="input_publish_all_ports"></a> [publish\_all\_ports](#input\_publish\_all\_ports) | Publish all ports of the container. | `bool` | `false` | no |
| <a name="input_read_only"></a> [read\_only](#input\_read\_only) | If true, the container will be started as readonly. | `bool` | `false` | no |
| <a name="input_remove_volumes"></a> [remove\_volumes](#input\_remove\_volumes) | If true, it will remove anonymous volumes associated with the container. | `bool` | `true` | no |
| <a name="input_restart"></a> [restart](#input\_restart) | The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no. | `string` | `"no"` | no |
| <a name="input_rm"></a> [rm](#input\_rm) | If true, then the container will be automatically removed when it exits. | `bool` | `false` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime to use for the container. | `string` | `null` | no |
| <a name="input_security_opts"></a> [security\_opts](#input\_security\_opts) | List of string values to customize labels for MLS systems, such as SELinux. See https://docs.docker.com/engine/reference/run/#security-configuration. | `set(string)` | `[]` | no |
| <a name="input_shm_size"></a> [shm\_size](#input\_shm\_size) | Size of /dev/shm in MBs. | `number` | `null` | no |
| <a name="input_start"></a> [start](#input\_start) | If true, then the Docker container will be started after creation. If false, then the container is only created. | `bool` | `true` | no |
| <a name="input_stdin_open"></a> [stdin\_open](#input\_stdin\_open) | If true, keep STDIN open even if not attached (docker run -i). | `bool` | `false` | no |
| <a name="input_stop_signal"></a> [stop\_signal](#input\_stop\_signal) | Signal to stop a container. | `string` | `"SIGTERM"` | no |
| <a name="input_stop_timeout"></a> [stop\_timeout](#input\_stop\_timeout) | Timeout (in seconds) to stop a container. | `number` | `null` | no |
| <a name="input_storage_opts"></a> [storage\_opts](#input\_storage\_opts) | Key/value pairs for the storage driver options, e.g. size: 120G | `map(string)` | `{}` | no |
| <a name="input_sysctls"></a> [sysctls](#input\_sysctls) | A map of kernel parameters (sysctls) to set in the container. | `map(string)` | `{}` | no |
| <a name="input_tmpfs"></a> [tmpfs](#input\_tmpfs) | A map of container directories which should be replaced by tmpfs mounts, and their corresponding mount options. | `map(string)` | `{}` | no |
| <a name="input_tty"></a> [tty](#input\_tty) | If true, allocate a pseudo-tty (docker run -t). | `bool` | `false` | no |
| <a name="input_ulimits"></a> [ulimits](#input\_ulimits) | Ulimit options to add.<br>[{<br>    hard = The hard limit (required)<br>    name = The name of the ulimit (required)<br>    soft = The soft limit (required)<br>}] | `list(any)` | `null` | no |
| <a name="input_uploads"></a> [uploads](#input\_uploads) | Specifies files to upload to the container before starting it. Only one of content or content\_base64 can be set and at least one of them has to be set.<br>[{<br>  file = Path to the file in the container where is upload goes to (required)<br>  content = Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Conflicts with content\_base64 & source (optional)<br>  content\_base64 = Base64-encoded data that will be decoded and uploaded as raw bytes for the object content. This allows safely uploading non-UTF8 binary data, but is recommended only for larger binary content such as the result of the base64encode interpolation function. See here for the reason. Conflicts with content & source (optional)<br>  executable = If true, the file will be uploaded with user executable permission. Defaults to false. (optional)<br>  source = A filename that references a file which will be uploaded as the object content. This allows for large file uploads that do not get stored in state. Conflicts with content & content\_base64 (optional)<br>  source\_hash = If using source, this will force an update if the file content has updated but the filename has not. (optional)<br>}] | `list(any)` | `null` | no |
| <a name="input_user"></a> [user](#input\_user) | User used for run the first process. Format is user or user:group which user and group can be passed literraly or by name. | `string` | `null` | no |
| <a name="input_userns_mode"></a> [userns\_mode](#input\_userns\_mode) | Sets the usernamespace mode for the container when usernamespace remapping option is enabled. | `string` | `null` | no |
| <a name="input_volumes"></a> [volumes](#input\_volumes) | Spec for mounting volumes in the container.<br>[{<br>  container\_path = The path in the container where the volume will be mounted. (optional)<br>  from\_container = The container where the volume is coming from. (optional)<br>  host\_path = The path on the host where the volume is coming from. (optional)<br>  read\_only = If true, this volume will be readonly. Defaults to false. (optional)<br>  volume\_name = The name of the docker volume which should be mounted. (optional)<br>}] | `list(any)` | `null` | no |
| <a name="input_wait"></a> [wait](#input\_wait) | If true, then the Docker container is waited for being healthy state after creation. If false, then the container health state is not checked. | `bool` | `false` | no |
| <a name="input_wait_timeout"></a> [wait\_timeout](#input\_wait\_timeout) | The timeout in seconds to wait the container to be healthy after creation. | `number` | `60` | no |
| <a name="input_working_dir"></a> [working\_dir](#input\_working\_dir) | The working directory for commands to run in. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bridge"></a> [bridge](#output\_bridge) | The network bridge of the container as read from its NetworkSettings. |
| <a name="output_container_logs"></a> [container\_logs](#output\_container\_logs) | The logs of the container if its execution is done (attach must be disabled). |
| <a name="output_exit_code"></a> [exit\_code](#output\_exit\_code) | The exit code of the container if its execution is done (must\_run must be disabled). |
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_network_data"></a> [network\_data](#output\_network\_data) | The data of the networks the container is connected to. |
<!-- END_TF_DOCS -->