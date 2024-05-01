terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "toke"
  cloud_id = "token"
  folder_id = "token"
  zone = "ru-central1-a"
}
