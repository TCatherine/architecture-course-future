variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер vCPU"
  type        = number

  validation {
    condition     = var.cores >= 2
    error_message = "Количество ядер должно быть не меньше 2."
  }
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number

  validation {
    condition     = var.memory >= 1
    error_message = "Объём RAM должен быть не меньше 1 ГБ."
  }
}

variable "core_fraction" {
  description = "Гарантированная доля vCPU, % (5, 20, 50, 100)"
  type        = number
  default     = 100
}

variable "platform_id" {
  description = "Платформа ВМ Yandex Cloud"
  type        = string
  default     = "standard-v3"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
}

variable "image_id" {
  description = "ID образа для загрузочного диска"
  type        = string
}

variable "boot_disk_size" {
  description = "Размер загрузочного диска, ГБ"
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "network-hdd"
}

# --- Подключаемый (secondary) диск --------------------------------------

variable "secondary_disk_size" {
  description = "Размер подключаемого диска, ГБ"
  type        = number
}

variable "secondary_disk_type" {
  description = "Тип подключаемого диска (network-hdd, network-ssd, ...)"
  type        = string
  default     = "network-hdd"
}

# --- Сеть -----------------------------------------------------------------

variable "subnet_id" {
  description = "ID подсети, к которой подключается ВМ"
  type        = string
}

variable "nat" {
  description = "Выдавать ли ВМ публичный IP (NAT)"
  type        = bool
  default     = false
}

# --- Доступ ----------------------------------------------------------------

variable "ssh_user" {
  description = "Имя пользователя для SSH-доступа"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  description = "Путь к публичному SSH-ключу"
  type        = string
}

# --- Прочее ----------------------------------------------------------------

variable "preemptible" {
  description = "Прерываемая ВМ (дешевле, подходит для dev)"
  type        = bool
  default     = false
}

variable "labels" {
  description = "Метки ресурса (например, environment)"
  type        = map(string)
  default     = {}
}
