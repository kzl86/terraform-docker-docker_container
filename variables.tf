variable "image" {
  description = "The ID of the image to back this container. The easiest way to get this value is to use the docker_image resource as is shown in the example."
  type        = string
}

variable "name" {
  description = "The name of the container."
  type        = string
}

variable "attach" {
  description = "If true attach to the container after its creation and waits the end of its execution."
  type        = bool
  default     = false
}

variable "capabilities" {
  description = <<EOF
Add or drop certrain linux capabilities.
{
  add = List of linux capabilities to add.
  drop = List of linux capabilities to drop.
}
EOF

  type = object({
    add  = optional(set(string), [])
    drop = optional(set(string), [])
  })
  default = null
}

variable "cgroupns_mode" {
  description = "Cgroup namespace mode to use for the container. Possible values are: private, host."
  type        = string
  default     = null
}

variable "command" {
  description = "The command to use to start the container."
  type        = list(string)
  default     = null
}

variable "container_read_refresh_timeout_milliseconds" {
  description = "The total number of milliseconds to wait for the container to reach status 'running'"
  type        = number
  default     = null
}

variable "cpu_set" {
  description = "A comma-separated list or hyphen-separated range of CPUs a container can use, e.g. 0-1."
  type        = string
  default     = null
}

variable "cpu_shares" {
  description = "CPU shares (relative weight) for the container."
  type        = number
  default     = null
}

variable "destroy_grace_seconds" {
  description = "If defined will attempt to stop the container before destroying. Container will be destroyed after n seconds or on successful stop."
  type        = number
  default     = null
}

variable "devices" {
  description = <<EOF
Bind devices to the container.
[{
    host_path = The path on the host where the device is located.
    container_path = The path in the container where the device will be bound.
    permissions = The cgroup permissions given to the container to access the device. Defaults to rwm.
}]
EOF

  type    = list(any)
  default = null
}

variable "dns" {
  description = "DNS servers to use."
  type        = set(string)
  default     = null
}

variable "dns_opts" {
  description = "DNS options used by the DNS provider(s), see resolv.conf documentation for valid list of options."
  type        = set(string)
  default     = null
}

variable "dns_search" {
  description = "DNS search domains that are used when bare unqualified hostnames are used inside of the container."
  type        = set(string)
  default     = null
}

variable "domainname" {
  description = "Domain name of the container."
  type        = string
  default     = null
}

variable "entrypoint" {
  description = "The command to use as the Entrypoint for the container. The Entrypoint allows you to configure a container to run as an executable."
  type        = list(string)
  default     = null
}

variable "env" {
  description = "Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
  type        = list(string)
  default     = []
}

variable "gpus" {
  description = "GPU devices to add to the container. Currently, only the value all is supported. Passing any other value will result in unexpected behavior."
  type        = string
  default     = null
}

variable "group_add" {
  description = "Additional groups for the container user."
  type        = set(string)
  default     = null
}

variable "healthcheck" {
  description = <<EOF
A test to perform to check that the container is healthy.
{
  test = Command to run to check health.
  interval = Time between running the check (ms|s|m|h).
  retries = Consecutive failures needed to report unhealthy.
  start_period = Start period for the container to initialize before counting retries towards unstable (ms|s|m|h).
  timeout = Maximum time to allow one check to run (ms|s|m|h).\n
}
EOF

  type = object({
    test         = list(string)
    interval     = optional(string, "0s")
    retries      = optional(number, 0)
    start_period = optional(string, "0s")
    timeout      = optional(string, "0s")
  })
  default = null
}

variable "host" {
  description = <<EOF
Additional hosts to add to the container.
{
  host = Hostname to add
  ip = IP address this hostname should resolve to.
}
EOF

  type = object({
    host = string
    ip   = string
  })
  default = null
}

variable "hostname" {
  description = "Hostname of the container."
  type        = string
  default     = null
}

variable "init" {
  description = "Configured whether an init process should be injected for this container. If unset this will default to the dockerd defaults."
  type        = bool
  default     = null
}

variable "ipc_mode" {
  description = "IPC sharing mode for the container. Possible values are: none, private, shareable, container:<name|id> or host."
  type        = string
  default     = null
}

variable "labels" {
  description = <<EOF
User-defined key/value metadata
[{
    label = Name of the label
    value = Value of the label
}]
EOF

  type    = map(any)
  default = {}
}

variable "log_driver" {
  description = "The logging driver to use for the container."
  type        = string
  default     = null
}

variable "log_opts" {
  description = "Key/value pairs to use as options for the logging driver."
  type        = map(string)
  default     = {}
}

variable "logs" {
  description = "Save the container logs (attach must be enabled)."
  type        = bool
  default     = false
}

variable "max_retry_count" {
  description = "The maximum amount of times to an attempt a restart when restart is set to 'on-failure'."
  type        = number
  default     = null
}

variable "memory" {
  description = "The memory limit for the container in MBs."
  type        = number
  default     = null
}

variable "memory_swap" {
  description = "The total memory limit (memory + swap) for the container in MBs. This setting may compute to -1 after terraform apply if the target host doesn't support memory swap, when that is the case docker will use a soft limitation."
  type        = number
  default     = null
}

variable "mounts" {
  description = <<EOF
Specification for mounts to be added to containers created as part of the service.
[{
    target = Container path. (required)
    type = The mount type. (required)
    bind_options = [{ # Optional configuration for the bind type. (maximum 1)
      propagation = A propagation mode with the value. (optional)
    }]
    read_only = Whether the mount should be read-only. (optional)
    source = Mount source (e.g. a volume name, a host path). (optional)
    tmpfs_options = [{ # Optional configuration for the tmpfs type. (maximum 1)
      mode       = The permission mode for the tmpfs mount in an integer. (optional)
      size_bytes = The size for the tmpfs mount in bytes. (optional)
    }]
    volume_options =[{ # Optional configuration for the volume type. (maximum 1)
      driver_name    = Name of the driver to use to create the volume. (optional)
      driver_options = key/value map of driver specific options. (optional)
      labels = [{ (optional)
        label = Name of the label (required)
        value = Value of the label (required)
      }]
      no_copy = Populate volume with data from the target. (optional)
    }]
}]
EOF

  type = list(object({
    target = string
    type   = string
    bind_options = optional(list(object({
      propagation = optional(string, null)
    })))
    read_only = optional(string, null)
    source    = optional(string, null)
    tmpfs_options = optional(list(object({
      mode       = optional(number, null)
      size_bytes = optional(number, null)
    })))
    volume_options = optional(list(object({
      driver_name    = optional(string, null)
      driver_options = optional(map(string), {})
      labels = optional(list(object({
        label = optional(string, null)
        value = optional(string, null)
      })))
      no_copy = optional(bool, null)
    })))
  }))
  default = null
}

variable "must_run" {
  description = "If true, then the Docker container will be kept running. If false, then as long as the container exists, Terraform assumes it is successful."
  type        = bool
  default     = true
}

variable "network_mode" {
  description = "Network mode of the container."
  type        = string
  default     = "default"
}

variable "networks_advanced" {
  description = <<EOF
The networks the container is attached to.
[{
  name         = The name or id of the network to use. You can use name or id attribute from a docker_network resource. (required)
  aliases      = The network aliases of the container in the specific network. (optional)
  ipv4_address = The IPV4 address of the container in the specific network. (optional)
  ipv6_address = The IPV6 address of the container in the specific network. (optional)
}]
EOF

  type    = list(any)
  default = null
}

variable "pid_mode" {
  description = "The PID (Process) Namespace mode for the container. Either container:<name|id> or host."
  type        = string
  default     = null
}

variable "ports" {
  description = <<EOF
Publish a container's port(s) to the host.
[{
  internal = Port within the container. (required)
  external = Port exposed out of the container. If not given a free random port >= 32768 will be used. (optional)
  ip       = IP address/mask that can access this port. Defaults to 0.0.0.0. (optional)
  protocol = Protocol that can be used over this port. Defaults to tcp. (optional)
}]
EOF 

  type    = list(any)
  default = null
}

variable "privileged" {
  description = "If true, the container runs in privileged mode."
  type        = bool
  default     = false
}

variable "publish_all_ports" {
  description = "Publish all ports of the container."
  type        = bool
  default     = false
}

variable "read_only" {
  description = "If true, the container will be started as readonly."
  type        = bool
  default     = false
}

variable "remove_volumes" {
  description = "If true, it will remove anonymous volumes associated with the container."
  type        = bool
  default     = true
}

variable "restart" {
  description = "The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no."
  type        = string
  default     = "no"
}

variable "rm" {
  description = "If true, then the container will be automatically removed when it exits."
  type        = bool
  default     = false
}

variable "runtime" {
  description = "Runtime to use for the container."
  type        = string
  default     = null
}

variable "security_opts" {
  description = "List of string values to customize labels for MLS systems, such as SELinux. See https://docs.docker.com/engine/reference/run/#security-configuration."
  type        = set(string)
  default     = []
}

variable "shm_size" {
  description = "Size of /dev/shm in MBs."
  type        = number
  default     = null
}

variable "start" {
  description = "If true, then the Docker container will be started after creation. If false, then the container is only created."
  type        = bool
  default     = true
}

variable "stdin_open" {
  description = "If true, keep STDIN open even if not attached (docker run -i)."
  type        = bool
  default     = false
}

variable "stop_signal" {
  description = "Signal to stop a container."
  type        = string
  default     = "SIGTERM"
}

variable "stop_timeout" {
  description = "Timeout (in seconds) to stop a container."
  type        = number
  default     = null
}

variable "storage_opts" {
  description = "Key/value pairs for the storage driver options, e.g. size: 120G"
  type        = map(string)
  default     = {}
}

variable "sysctls" {
  description = "A map of kernel parameters (sysctls) to set in the container."
  type        = map(string)
  default     = {}
}

variable "tmpfs" {
  description = "A map of container directories which should be replaced by tmpfs mounts, and their corresponding mount options."
  type        = map(string)
  default     = {}
}

variable "tty" {
  description = "If true, allocate a pseudo-tty (docker run -t)."
  type        = bool
  default     = false
}

variable "ulimits" {
  description = <<EOF
Ulimit options to add.
[{
    hard = The hard limit (required)
    name = The name of the ulimit (required)
    soft = The soft limit (required)
}]
EOF

  type    = list(any)
  default = null
}

variable "uploads" {
  description = <<EOF
Specifies files to upload to the container before starting it. Only one of content or content_base64 can be set and at least one of them has to be set.
[{
  file = Path to the file in the container where is upload goes to (required)
  content = Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Conflicts with content_base64 & source (optional)
  content_base64 = Base64-encoded data that will be decoded and uploaded as raw bytes for the object content. This allows safely uploading non-UTF8 binary data, but is recommended only for larger binary content such as the result of the base64encode interpolation function. See here for the reason. Conflicts with content & source (optional)
  executable = If true, the file will be uploaded with user executable permission. Defaults to false. (optional)
  source = A filename that references a file which will be uploaded as the object content. This allows for large file uploads that do not get stored in state. Conflicts with content & content_base64 (optional)
  source_hash = If using source, this will force an update if the file content has updated but the filename has not. (optional)
}]
EOF

  type    = list(any)
  default = null
}

variable "user" {
  description = "User used for run the first process. Format is user or user:group which user and group can be passed literraly or by name."
  type        = string
  default     = null
}

variable "userns_mode" {
  description = "Sets the usernamespace mode for the container when usernamespace remapping option is enabled."
  type        = string
  default     = null
}

variable "volumes" {
  description = <<EOF
Spec for mounting volumes in the container.
[{
  container_path = The path in the container where the volume will be mounted. (optional)
  from_container = The container where the volume is coming from. (optional)
  host_path = The path on the host where the volume is coming from. (optional)
  read_only = If true, this volume will be readonly. Defaults to false. (optional)
  volume_name = The name of the docker volume which should be mounted. (optional)
}]
EOF

  type    = list(any)
  default = null
}

variable "wait" {
  description = "If true, then the Docker container is waited for being healthy state after creation. If false, then the container health state is not checked."
  type        = bool
  default     = false
}

variable "wait_timeout" {
  description = "The timeout in seconds to wait the container to be healthy after creation."
  type        = number
  default     = 60
}

variable "working_dir" {
  description = "The working directory for commands to run in."
  type        = string
  default     = null
}