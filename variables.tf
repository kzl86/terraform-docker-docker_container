variable "name" {
    description = "The name of the container."
    type        = string
}

variable "image" {
    description = "The ID of the image to back this container. The easiest way to get this value is to use the docker_image resource as is shown in the example."
    type        = string
}

variable "restart" {
    description = "The restart policy for the container. Must be one of 'no', 'on-failure', 'always', 'unless-stopped'. Defaults to no."
    type        = string
    default     = "no"
}

variable "labels" {
    description = "User-defined key/value metadata"
    type        = map
    default     = {}
}

variable "env" {
    description = "Environment variables to set in the form of KEY=VALUE, e.g. DEBUG=0"
    type        = list(string)
    default     = []
}

variable "mounts" {
    description = "Specification for mounts to be added to containers created as part of the service."
    type        = list
    default     = null
}

variable "ports" {
    description = "Publish a container's port(s) to the host."
    type        = list
    default     = null
}