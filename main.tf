terraform {
  required_providers {
    docker = {
      source = "terraform-providers/docker"
    }
  }
}

variable "password" {}
variable "pass" {}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "tanya"
  ports {
    internal = var.password
    external = 8005
  }
}

data "terraform_remote_state" "foo" {
  backend = "local"

  config = {
    path = "/Users/tanyatalwar/codes/terraform-docker-demo/terraform.tfstate"
  }
}





