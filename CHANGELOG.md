# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v3.0.1] - 2024-09-03

### Changed

- Update nginx example source

## [v3.0.0] - 2024-09-03

### Added

- variable "attach"
- variable "capabilities"
- variable "cgroupns_mode"
- variable "command"
- variable "container_read_refresh_timeout_milliseconds"
- variable "cpu_set"
- variable "cpu_shares"
- variable "destroy_grace_seconds"
- variable "devices"
- variable "dns"
- variable "dns_opts"
- variable "dns_search"
- variable "domainname"
- variable "gpus"
- variable "group_add"
- variable "healthcheck"
- variable "host"
- variable "hostname"
- variable "init"
- variable "ipc_mode"
- variable "log_driver"
- variable "logs"
- variable "max_retry_count"
- variable "memory"
- variable "memory_swap"
- variable "must_run"
- variable "pid_mode"
- variable "privileged"
- variable "publish_all_ports"
- variable "read_only"
- variable "remove_volumes"
- variable "rm"
- variable "runtime"
- variable "security_opts"
- variable "shm_size"
- variable "start"
- variable "stdin_open"
- variable "stop_signal"
- variable "stop_timeout"
- variable "storage_opts"
- variable "sysctls"
- variable "tmpfs"
- variable "tty"
- variable "uploads"
- variable "user"
- variable "userns_mode"
- variable "volumes"
- variable "wait"
- variable "wait_timeout"
- variable "working_dir"
- examples directory with nginx example

### Changed

- The "mounts" variable type change to support all fields.
- IP field add to "ports"
- Fields "ipv4_address" and "ipv6_address" add to "networks_advanced"

## [v2.1.0] - 2024-03-27

### Added

- Support ulimit options to add
- Support logging options for the logging driver

### Fixed

- Change variable entrypoint default to null to prevent unnecessary resource replacement

## [v2.0.0] - 2024-03-26

### Changed

- Terraform version update to v1.7.5
- Docker provider update to v3.0.2

## [v1.1.0] - 2023-06-27

### Added

- Network and entrypoint for container
- variable "networks_advanced"
- variable "entrypoint"

## [v1.0.2] - 2023-06-19

### Added

- variable "network_mode"

## [v1.0.1] - 2023-06-14

### Changed

- Change key to index in local.mounts similar to local.ports

### Fixed

- Fix "duplicate object key" error when same internal port is used

## [v1.0.0] - 2023-06-10

### Added

- Initial base module with basic functionality
- resource "docker_container"
- variable "name"
- variable "image"
- variable "restart"
- variable "labels"
- variable "env"
- variable "mounts"
- variable "ports"
