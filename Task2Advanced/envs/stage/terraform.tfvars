# --- stage: средние ресурсы, конфигурация приближена к prod ---
cloud_id  = "b1g-stage-cloud-id"
folder_id = "b1g84tgmanunupr26hpa"

environment = "stage"
vm_name     = "future20-stage-vm"

cores         = 4
memory        = 8
core_fraction = 100

zone     = "ru-central1-b"
image_id = "fd8kdq6d0p8sij7h5qe3" # Ubuntu 22.04 LTS

boot_disk_size      = 30
secondary_disk_size = 50
secondary_disk_type = "network-ssd"

subnet_id = "e2l-stage-subnet-id"
nat       = false

ssh_user            = "ubuntu"
# ssh_public_key_path задаётся в CI через TF_VAR_ssh_public_key_path (секрет не в репозитории)

preemptible = false
