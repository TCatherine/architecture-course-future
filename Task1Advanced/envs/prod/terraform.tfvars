cloud_id  = "cclb1g3gm7u3h4cogg0pvkc"
folder_id = "b1g84tgmanunupr26hpa"

environment = "prod"
vm_name     = "future20-prod-vm"

cores         = 2
memory        = 2
core_fraction = 20

zone     = "ru-central1-d"
image_id = "fd8kdq6d0p8sij7h5qe3" # Ubuntu 22.04 LTS

boot_disk_size      = 10
secondary_disk_size = 20
secondary_disk_type = "network-ssd"

subnet_id = "fl8nln9jejd45oj7hro9"
nat       = false

ssh_user            = "ubuntu"
ssh_public_key_path = "~/.ssh/id_ed25519.pub"

preemptible = false
