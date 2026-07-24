terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock" 
}

resource "docker_image" "app_image" {
  name         = "local-app:latest"
  keep_locally = true 
}

resource "docker_container" "app_container" {
  image = docker_image.app_image.image_id
  name  = "final_project"
  
  ports {
    internal = 80       
    external = 8081     
  }
}
