output "vm_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "internal_ip" {
  description = "Внутренний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "external_ip" {
  description = "Публичный IP-адрес (null, если NAT выключен)"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "secondary_disk_id" {
  description = "ID подключаемого диска"
  value       = yandex_compute_disk.secondary.id
}

output "zone" {
  description = "Зона доступности ВМ"
  value       = yandex_compute_instance.vm.zone
}
