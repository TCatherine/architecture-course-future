# ---------------------------------------------------------------------------
# Удалённое хранение состояния: Yandex Object Storage (S3-совместимый API).
#
# Здесь только несекретная часть конфигурации. Креды передаются через
# переменные окружения (статический ключ доступа сервисного аккаунта):
#   AWS_ACCESS_KEY_ID     — key_id статического ключа
#   AWS_SECRET_ACCESS_KEY — secret статического ключа
#
# Создание ключа:  yc iam access-key create --service-account-id <sa_id>
# Сервисному аккаунту нужна роль storage.editor на каталог с бакетом.
#
# Локально состояние НЕ хранится.
# ---------------------------------------------------------------------------

terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    bucket = "tki-terraform-state"
    key    = "future20/prod/terraform.tfstate"
    region = "ru-central1"

    # Флаги совместимости с не-AWS S3
    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true

    # Блокировка состояния lock-файлом в том же бакете (Terraform >= 1.10)
    use_lockfile = true
  }
}
