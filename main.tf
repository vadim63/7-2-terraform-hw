resource "docker_image" "nginx" {
  name = var.containers.nginx.image
  keep_locally = true
}

resource "docker_image" "wordpress" {
  name = var.containers.wordpress.image
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = "best-container-in-the-world-${var.containers.nginx.name}"
  ports {
    internal = var.containers.nginx.ports.internal
    external = var.containers.nginx.ports.external
  }
  network_mode="bridge"
}

resource "docker_container" "wordpress" {
  image = docker_image.wordpress.image_id
  name = "best-container-in-the-world-${var.containers.wordpress.name}"
  ports {
    internal = var.containers.wordpress.ports.internal
    external = var.containers.wordpress.ports.external
  }
}

resource "random_password" "pass" {
  length = 16
}

resource "local_file" "file_xxx" {
  content = "our-cool-project-${random_password.pass.result}"
  filename = "/tmp/file_xxx.txt"
}

data "local_file" "from_file"{
  filename = "/etc/passwd"
}