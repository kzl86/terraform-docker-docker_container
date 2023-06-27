locals {
    mounts = var.mounts != null ? { 
        for index, mount in var.mounts :
            index => {
                "target"    = lookup(mount, "target", null)
                "type"      = lookup(mount, "type", null)
                "source"    = lookup(mount, "source", null)
                "read_only" = lookup(mount, "read_only", null)
            }
    } : {}

    ports = var.ports != null ? { 
        for index, port in var.ports :
            index => {
                "internal" = lookup(port, "internal", null)
                "external" = lookup(port, "external", null)
                "protocol" = lookup(port, "protocol", null)
            }
    } : {}

    networks_advanced = var.networks_advanced != null ? { 
        for index, network in var.networks_advanced :
            index => {
                "name"    = lookup(network, "name", null)
                "aliases" = lookup(network, "aliases", null)
            }
    } : {}
}

resource "docker_container" "this" {
    name         = var.name
    image        = var.image
    restart      = var.restart
    network_mode = var.network_mode

    env = var.env

    dynamic "labels" {
        for_each = var.labels

        content {
            label = labels.key
            value = labels.value
        }
    }

    dynamic "mounts" {
        for_each = local.mounts

        content {
            target    = lookup(mounts.value, "target", null)
            type      = lookup(mounts.value, "type", null)
            source    = lookup(mounts.value, "source", null)
            read_only = lookup(mounts.value, "read_only", false)
        }
    }

    dynamic "ports" {
        for_each = local.ports

        content {
            internal = lookup(ports.value, "internal", null)
            external = lookup(ports.value, "external", null)
            protocol = lookup(ports.value, "protocol", null)
        }
    }

    dynamic "networks_advanced" {
        for_each = local.networks_advanced

        content {
            name    = lookup(networks_advanced.value, "name", null)
            aliases = lookup(networks_advanced.value, "aliases", null)
        }
    }

    entrypoint = var.entrypoint

}