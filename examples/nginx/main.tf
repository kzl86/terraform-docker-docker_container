resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

variable "nginx_mount_source" {
  type = string
}

module "nginx_container" {
    source  = "git::https://github.com/kzl86/terraform-docker-container.git?ref=v3.0.0"
    name    = "nginx-example"
    image   = docker_image.nginx.image_id
    restart = "unless-stopped"

    env = [
      "NGINX_HOST=nginx-example.com",
      "NGINX_PORT=80"
    ]

    mounts = [{
      "target"    = "/usr/share/nginx/html"
      "source"    = "${var.nginx_mount_source}/content"
      "type"      = "bind"  
      "read_only" = true
    }]

    ports = [{
      "internal" = 80
      "external" = 8080
      "protocol" = "tcp"
    }]
}