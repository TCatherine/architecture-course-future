terraform {
  required_version = ">= 1.3"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.100"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  vm_name             = var.vm_name
  cores               = var.cores
  memory              = var.memory
  core_fraction       = var.core_fraction
  zone                = var.zone
  image_id            = var.image_id
  boot_disk_size      = var.boot_disk_size
  secondary_disk_size = var.secondary_disk_size
  secondary_disk_type = var.secondary_disk_type
  subnet_id           = var.subnet_id
  nat                 = var.nat
  ssh_user            = var.ssh_user
  ssh_public_key_path = var.ssh_public_key_path
  preemptible         = var.preemptible

  labels = {
    environment = var.environment
  }
}
