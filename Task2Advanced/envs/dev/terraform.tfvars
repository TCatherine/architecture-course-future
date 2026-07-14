# --- dev: минимальные ресурсы, прерываемая ВМ ---
cloud_id  = "b1g-dev-cloud-id"
folder_id = "b1g84tgmanunupr26hpa"

environment = "dev"
vm_name     = "future20-dev-vm"

cores         = 2
memory        = 2
core_fraction = 20

zone     = "ru-central1-a"
image_id = "fd8kdq6d0p8sij7h5qe3" # Ubuntu 22.04 LTS

boot_disk_size      = 20
secondary_disk_size = 10
secondary_disk_type = "network-hdd"

subnet_id = "e9b4gg20ju5b5cquk9lr"
nat       = true

ssh_user            = "ubuntu"
# ssh_public_key_path задаётся в CI через TF_VAR_ssh_public_key_path (секрет не в репозитории)

preemptible = true
