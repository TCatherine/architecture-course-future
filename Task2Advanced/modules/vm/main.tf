# ---------------------------------------------------------------------------
# Модуль vm: виртуальная машина Yandex Cloud + подключаемый диск + сеть.
# Все параметры приходят через variables.tf.
# ---------------------------------------------------------------------------

terraform {
  required_version = ">= 1.3"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100"
    }
  }
}

# Подключаемый (secondary) диск
resource "yandex_compute_disk" "secondary" {
  name   = "${var.vm_name}-data-disk"
  type   = var.secondary_disk_type
  zone   = var.zone
  size   = var.secondary_disk_size
  labels = var.labels
}

# Виртуальная машина
resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone
  labels      = var.labels

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.boot_disk_size
      type     = var.boot_disk_type
    }
  }

  secondary_disk {
    disk_id     = yandex_compute_disk.secondary.id
    auto_delete = false
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.nat
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.ssh_public_key_path)}"
  }
}
