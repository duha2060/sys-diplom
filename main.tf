terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token = "y0_AgAAAAAgmCVfAATuwQAAAADwls3fFTlvS0ksQHuj6uVksPFeH8Goqq4"
  cloud_id = "b1ga3ko2a8tfk5f7tbh7"
  folder_id = "b1g8e5dbjk7p1t1o2hnr"
  zone = "ru-central1-a"
}
