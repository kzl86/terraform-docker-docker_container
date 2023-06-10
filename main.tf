locals {
    mounts = var.mounts != null ? { 
        for mount in var.mounts :
            lookup(mount, "target", null) => {
                "type"      = lookup(mount, "type", null)
                "source"    = lookup(mount, "source", null)
                "read_only" = lookup(mount, "read_only", null)
            }
    } : {}

    ports = var.ports != null ? { 
        for port in var.ports :
            lookup(port, "internal", null) => {
                "external" = lookup(port, "external", null)
                "protocol" = lookup(port, "protocol", null)
            }
    } : {}
}

resource "docker_container" "this" {
    name     = var.name
    image    = var.image
    restart  = var.restart

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
            target    = mounts.key
            type      = lookup(mounts.value, "type", null)
            source    = lookup(mounts.value, "source", null)
            read_only = lookup(mounts.value, "read_only", false)
        }
    }

    dynamic "ports" {
        for_each = local.ports

        content {
            internal = ports.key
            external = lookup(ports.value, "external", null)
            protocol = lookup(ports.value, "protocol", null)
        }
    }

}