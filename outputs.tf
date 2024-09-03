output "bridge" {
  value       = docker_container.this.bridge
  description = "The network bridge of the container as read from its NetworkSettings."
}

output "container_logs" {
  value       = var.attach == false ? docker_container.this.container_logs : ""
  description = "The logs of the container if its execution is done (attach must be disabled)."
}

output "exit_code" {
  value       = var.must_run == false ? docker_container.this.exit_code : ""
  description = "The exit code of the container if its execution is done (must_run must be disabled)."
}

output "id" {
  value       = docker_container.this.id
  description = "The ID of this resource."
}

output "network_data" {
  value       = docker_container.this.network_data
  description = "The data of the networks the container is connected to."
}