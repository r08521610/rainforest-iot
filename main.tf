terraform {
  required_providers {
    docker = {
      source                = "kreuzwerker/docker"
      version               = "~> 3.0"
      configuration_aliases = [docker]
    }
  }
}

provider "docker" {
  alias = "raspberry-pi"
  host  = "ssh://rainforest@raspberrypi-4:22"
}

module "homeassistant" {
  source = "./modules/homeassistant"

  providers = {
    docker = docker.raspberry-pi
  }
}

module "acton-3" {
  source = "./modules/acton-3"

  providers = {
    docker = docker.raspberry-pi
  }
}