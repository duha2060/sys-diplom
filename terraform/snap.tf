resource "yandex_compute_snapshot_schedule" "default" {
  name = "default"

  schedule_policy {
    expression = "0 5 ? * *"
  }

  snapshot_count = 7

  snapshot_spec {
    description = "daily"
  }

  disk_ids = [yandex_compute_instance.app01.boot_disk[0].disk_id, 
              yandex_compute_instance.app02.boot_disk[0].disk_id,  
              yandex_compute_instance.zabbix.boot_disk[0].disk_id, 
              yandex_compute_instance.elasticsearch.boot_disk[0].disk_id, 
              yandex_compute_instance.kibana.boot_disk[0].disk_id, 
              yandex_compute_instance.bastion.boot_disk[0].disk_id]
}