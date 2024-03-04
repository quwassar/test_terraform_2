terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

}

provider "yandex" {
  token     = var.token
  folder_id = "b1g0eqv5v1h5mspqaag1"
  zone      = "ru-central1-a"
}
