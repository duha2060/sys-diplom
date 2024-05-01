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