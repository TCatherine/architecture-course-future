# --- prod: максимальные ресурсы, SSD, без публичного IP ---
cloud_id  = "cclb1g3gm7u3h4cogg0pvkc"
folder_id = "b1g84tgmanunupr26hpa"

environment = "prod"
vm_name     = "future20-prod-vm"

cores         = 8
memory        = 16
core_fraction = 100

zone     = "ru-central1-d"
image_id = "fd8kdq6d0p8sij7h5qe3" # Ubuntu 22.04 LTS

boot_disk_size      = 50
secondary_disk_size = 200
secondary_disk_type = "network-ssd"

subnet_id = "enp3lq7keectdfotp4a0"
nat       = false

ssh_user            = "ubuntu"
# ssh_public_key_path задаётся в CI через TF_VAR_ssh_public_key_path (секрет не в репозитории)

preemptible = false
