resource "yandex_vpc_network" "network-1" {
  name = "network-1"
}

#Сеть для app01
resource "yandex_vpc_subnet" "subnet-app01" {
  name = "subnet-app01"
  v4_cidr_blocks = ["192.168.1.0/24"]
  network_id  = "${yandex_vpc_network.network-1.id}"
}

#Сеть для app02 
resource "yandex_vpc_subnet" "subnet-app02" {
  name = "subnet-app02"
  v4_cidr_blocks = ["192.168.2.0/24"]
  network_id = "${yandex_vpc_network.network-1.id}"
}
#private
resource "yandex_vpc_subnet" "subnet-private" {
  name = "subnet-zabbix"
  v4_cidr_blocks = ["192.168.3.0/24"]
  network_id = "${yandex_vpc_network.network-1.id}"
}

#public
resource "yandex_vpc_subnet" "subnet-public" {
  name = "subnet-zabbix"
  v4_cidr_blocks = ["192.168.3.0/24"]
  network_id = "${yandex_vpc_network.network-1.id}"
}


resource "yandex_alb_backend_group" "backend-group" {
  name = "backend-group"

  http_backend {
    name             = "backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.web.id]

    load_balancing_config {
      panic_threshold = 90
    }

    healthcheck {
      timeout             = "15s"
      interval            = "2s"
      healthy_threshold   = 10
      unhealthy_threshold = 15
      http_healthcheck {
        path = "/"
      }
    }
  }
}
