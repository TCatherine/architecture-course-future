variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "environment" {
  description = "Имя окружения (dev/stage/prod)"
  type        = string
}

variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер vCPU"
  type        = number
}

variable "memory" {
  description = "Объём RAM, ГБ"
  type        = number
}

variable "core_fraction" {
  description = "Гарантированная доля vCPU, %"
  type        = number
  default     = 100
}

variable "zone" {
  description = "Зона доступности"
  type        = string
}

variable "image_id" {
  description = "ID образа загрузочного диска"
  type        = string
}

variable "boot_disk_size" {
  description = "Размер загрузочного диска, ГБ"
  type        = number
  default     = 20
}

variable "secondary_disk_size" {
  description = "Размер подключаемого диска, ГБ"
  type        = number
}

variable "secondary_disk_type" {
  description = "Тип подключаемого диска"
  type        = string
  default     = "network-hdd"
}

variable "subnet_id" {
  description = "ID подсети"
  type        = string
}

variable "nat" {
  description = "Публичный IP (NAT)"
  type        = bool
  default     = false
}

variable "ssh_user" {
  description = "Пользователь для SSH"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
}

variable "preemptible" {
  description = "Прерываемая ВМ"
  type        = bool
  default     = false
}
