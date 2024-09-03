locals {
  devices = var.devices != null ? {
    for index, device in var.devices :
    index => {
      "host_path"      = lookup(device, "host_path", null)
      "container_path" = lookup(device, "container_path", null)
      "permissions"    = lookup(device, "permissions", null)
    }
  } : {}

  networks_advanced = var.networks_advanced != null ? {
    for index, network in var.networks_advanced :
    index => {
      "name"         = lookup(network, "name", null)
      "aliases"      = lookup(network, "aliases", null)
      "ipv4_address" = lookup(network, "ipv4_address", null)
      "ipv6_address" = lookup(network, "ipv6_address", null)
    }
  } : {}

  ports = var.ports != null ? {
    for index, port in var.ports :
    index => {
      "internal" = lookup(port, "internal", null)
      "external" = lookup(port, "external", null)
      "ip"       = lookup(port, "ip", null)
      "protocol" = lookup(port, "protocol", null)
    }
  } : {}

  ulimits = var.ulimits != null ? {
    for index, ulimit in var.ulimits :
    index => {
      "hard" = lookup(ulimit, "hard", null)
      "name" = lookup(ulimit, "name", null)
      "soft" = lookup(ulimit, "soft", null)
    }
  } : {}

  uploads = var.uploads != null ? {
    for index, upload in var.uploads :
    index => {
      "file"           = lookup(upload, "file", null)
      "content"        = lookup(upload, "content", null)
      "content_base64" = lookup(upload, "content_base64", null)
      "executable"     = lookup(upload, "executable", null)
      "source"         = lookup(upload, "source", null)
      "source_hash"    = lookup(upload, "source_hash", null)
    }
  } : {}

  volumes = var.volumes != null ? {
    for index, volume in var.volumes :
    index => {
      "container_path" = lookup(volume, "container_path", null)
      "from_container" = lookup(volume, "from_container", null)
      "host_path"      = lookup(volume, "host_path", null)
      "read_only"      = lookup(volume, "read_only", null)
      "volume_name"    = lookup(volume, "volume_name", null)
    }
  } : {}
}

resource "docker_container" "this" {
  image  = var.image
  name   = var.name
  attach = var.attach

  dynamic "capabilities" {
    for_each = var.capabilities != null ? [var.capabilities] : []

    content {
      add  = var.capabilities.add
      drop = var.capabilities.drop
    }
  }

  cgroupns_mode                               = var.cgroupns_mode
  command                                     = var.command
  container_read_refresh_timeout_milliseconds = var.container_read_refresh_timeout_milliseconds
  cpu_set                                     = var.cpu_set
  cpu_shares                                  = var.cpu_shares
  destroy_grace_seconds                       = var.destroy_grace_seconds

  dynamic "devices" {
    for_each = local.devices

    content {
      host_path      = lookup(devices.value, "host_path", null)
      container_path = lookup(devices.value, "container_path", null)
      permissions    = lookup(devices.value, "permissions", null)
    }
  }

  dns        = var.dns
  dns_opts   = var.dns_opts
  dns_search = var.dns_search
  domainname = var.domainname
  entrypoint = var.entrypoint
  env        = var.env
  gpus       = var.gpus
  group_add  = var.group_add

  dynamic "healthcheck" {
    for_each = var.healthcheck != null ? [var.healthcheck] : []

    content {
      test         = var.healthcheck.test
      interval     = var.healthcheck.interval
      retries      = var.healthcheck.retries
      start_period = var.healthcheck.start_period
      timeout      = var.healthcheck.timeout
    }
  }

  dynamic "host" {
    for_each = var.host != null ? [var.host] : []

    content {
      host = var.host.host
      ip   = var.host.ip
    }
  }

  hostname = var.hostname
  init     = var.init
  ipc_mode = var.ipc_mode

  dynamic "labels" {
    for_each = var.labels

    content {
      label = labels.key
      value = labels.value
    }
  }

  log_driver      = var.log_driver
  log_opts        = var.log_opts
  logs            = var.logs
  max_retry_count = var.max_retry_count
  memory          = var.memory
  memory_swap     = var.memory_swap

  dynamic "mounts" {
    for_each = var.mounts != null ? var.mounts : []

    content {
      target = mounts.value.target
      type   = mounts.value.type

      dynamic "bind_options" {
        for_each = mounts.value.bind_options != null ? { for index, value in mounts.value.bind_options : index => value } : {}
        content {
          propagation = bind_options.value.propagation
        }
      }

      read_only = mounts.value.read_only
      source    = mounts.value.source

      dynamic "tmpfs_options" {
        for_each = mounts.value.tmpfs_options != null ? { for index, value in mounts.value.tmpfs_options : index => value } : {}
        content {
          mode       = tmpfs_options.value.mode
          size_bytes = tmpfs_options.value.size_bytes
        }
      }

      dynamic "volume_options" {
        for_each = mounts.value.volume_options != null ? { for index, value in mounts.value.volume_options : index => value } : {}
        content {
          driver_name    = volume_options.value.driver_name
          driver_options = volume_options.value.driver_options
          dynamic "labels" {
            for_each = volume_options.value.labels != null ? { for l, v in volume_options.value.labels : l => v } : {}
            content {
              label = labels.value.label
              value = labels.value.value
            }
          }
          no_copy = volume_options.value.no_copy
        }
      }
    }
  }

  must_run     = var.must_run
  network_mode = var.network_mode

  dynamic "networks_advanced" {
    for_each = local.networks_advanced

    content {
      name    = lookup(networks_advanced.value, "name", null)
      aliases = lookup(networks_advanced.value, "aliases", null)
    }
  }

  pid_mode = var.pid_mode

  dynamic "ports" {
    for_each = local.ports

    content {
      internal = lookup(ports.value, "internal", null)
      external = lookup(ports.value, "external", null)
      protocol = lookup(ports.value, "protocol", null)
    }
  }

  privileged        = var.privileged
  publish_all_ports = var.publish_all_ports
  read_only         = var.read_only
  remove_volumes    = var.remove_volumes
  restart           = var.restart
  rm                = var.rm
  runtime           = var.runtime
  security_opts     = var.security_opts
  shm_size          = var.shm_size
  start             = var.start
  stdin_open        = var.stdin_open
  stop_signal       = var.stop_signal
  stop_timeout      = var.stop_timeout
  storage_opts      = var.storage_opts
  sysctls           = var.sysctls
  tmpfs             = var.tmpfs
  tty               = var.tty

  dynamic "ulimit" {
    for_each = local.ulimits

    content {
      hard = lookup(ulimit.value, "hard", null)
      name = lookup(ulimit.value, "name", null)
      soft = lookup(ulimit.value, "soft", null)
    }
  }

  dynamic "upload" {
    for_each = local.uploads

    content {
      file           = lookup(upload.value, "file", null)
      content        = lookup(upload.value, "content", null)
      content_base64 = lookup(upload.value, "content_base64", null)
      executable     = lookup(upload.value, "executable", null)
      source         = lookup(upload.value, "source", null)
      source_hash    = lookup(upload.value, "source_hash", null)
    }
  }

  user        = var.user
  userns_mode = var.userns_mode

  dynamic "volumes" {
    for_each = local.volumes

    content {
      container_path = lookup(volumes.value, "container_path", null)
      from_container = lookup(volumes.value, "from_container", null)
      host_path      = lookup(volumes.value, "host_path", null)
      read_only      = lookup(volumes.value, "read_only", null)
      volume_name    = lookup(volumes.value, "volume_name", null)
    }
  }

  wait         = var.wait
  wait_timeout = var.wait_timeout
  working_dir  = var.working_dir
}