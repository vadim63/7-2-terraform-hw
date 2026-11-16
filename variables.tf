variable "string"{
  type=string
  default = "def string"
}

variable "number" {
  type=number
  default = 0
}

variable "list_of_strings" {
  type = list(string)
  default = [ "a", "b", "c" ]
}

variable "list_of_numbers" {
  type = list(number)
  default = [ 0, 1, 2 ]
}

variable "bool" {
  type = bool
  default = false
}

variable "map" {
  type = map(string)
  default = {
    "str1" = "value1"
    "str2" = "value2"
    "str3" = "value3"
  }
}

variable "containers" {
  type = map(object({
    name = string
    image = string
    ports = object({
      external = number
      internal = number
    })
  }))
  default = {
    nginx = {
      name = "nginx"
      image = "nginx:1.21.1"
      ports = {
        external = 1080
        internal = 80
      }
    },
    wordpress = {
        name = "wordpress"
        image = "wordpress:latest"
        ports = {
          external = 2080
          internal = 80
        }
    }
  }
}