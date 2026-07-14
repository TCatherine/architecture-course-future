terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    bucket = "tki-terraform-state"
    key    = "future20/dev/terraform.tfstate"
    region = "ru-central1"

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true

    # Блокировка состояния lock-файлом в том же бакете (Terraform >= 1.10)
    use_lockfile = true
  }
}
