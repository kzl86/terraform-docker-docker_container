## Example description

This is an example which deploys an nginx container with static content via the terraform module. As a prerequisite docker should be installed.

## Usage

```bash
# Clone the repository
git clone --branch v3.0.0 https://github.com/kzl86/terraform-docker-container && mv terraform-docker-container/examples/nginx ./ && cd nginx

# Get the terraform binary
wget https://releases.hashicorp.com/terraform/1.7.5/terraform_1.7.5_linux_amd64.zip

# Decompress in the current directory
unzip terraform_1.7.5_linux_amd64.zip

# Deploy the example nginx module to host
export TF_VAR_nginx_mount_source=$(pwd) && ./terraform init && ./terraform apply --auto-approve

# Validate the nginx webserver
curl localhost:8080
```

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nginx_container"></a> [nginx\_container](#module\_nginx\_container) | git::https://github.com/kzl86/tf-docker-container.git | v3.0.0 |

## Resources

| Name | Type |
|------|------|
| [docker_image.nginx](https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs/resources/image) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nginx_mount_source"></a> [nginx\_mount\_source](#input\_nginx\_mount\_source) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->