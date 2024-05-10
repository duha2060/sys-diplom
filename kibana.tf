resource "yandex_compute_instance" "kibana" {
    name = "kibana"
    allow_stopping_for_update = true
    platform_id = "standard-v2"
    zone = "ru-central1-d"

    resources {
        cores = 2
        core_fraction = 20
        memory = 2
    }

    boot_disk {
        initialize_params {
            image_id = "fd830gae25ve4glajds"
            size = 10
        }
    }

    network_interface {
        subnet_id = "${yandex_vpc_subnet.subnet-public.id}"
    }

    metadata = {
        user-data = file("./meta.yml")
    }
}

