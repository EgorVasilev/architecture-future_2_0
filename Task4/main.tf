terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  # cloud_id, folder_id и токен подхватятся из переменных окружения
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2404-lts-oslogin"
}

# 1. Сетевая инфраструктура (VPC)
resource "yandex_vpc_network" "analytics_net" {
  name = "future20-analytics-network"
}

resource "yandex_vpc_subnet" "private_subnet" {
  name           = "analytics-private-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.analytics_net.id
  v4_cidr_blocks = ["10.100.1.0/24"]
  route_table_id = yandex_vpc_route_table.nat_route.id
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = "analytics-public-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.analytics_net.id
  v4_cidr_blocks = ["10.100.2.0/24"]
}

# NAT Gateway для выхода приватных инстансов в интернет (скачивание образов/пакетов)
resource "yandex_vpc_gateway" "nat_gw" {
  name = "analytics-nat-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "nat_route" {
  name       = "analytics-nat-route-table"
  network_id = yandex_vpc_network.analytics_net.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gw.id
  }
}

# 2. Выделенные диски (Хранилище)
resource "yandex_compute_disk" "portal_root_disk" {
  name     = "portal-root-disk"
  type     = "network-hdd"
  zone     = var.zone
  size     = 6 # ГБ для ОС, кэша, DataHub и Apache Superset (значение уменьшено для лимитов учебного проекта)
}

resource "yandex_compute_disk" "processing_data_disk" {
  name     = "processing-data-disk"
  type     = "network-hdd" # Максимальная скорость IOPS для OLAP/Trino
  zone     = var.zone
  size     = 6 # ГБ под горячий слой кэширования сотен ТБ данных аналитики (значение уменьшено для лимитов учебного проекта)
}

# 3. Виртуальные машины
# VM 1: Портал самообслуживания (Data Catalog + Superset UI)
resource "yandex_compute_instance" "portal_vm" {
  name        = "future20-data-portal"
  platform_id = "standard-v3" # Intel Ice Lake
  zone        = var.zone

  resources {
    cores  = var.portal_vm_cores
    memory = var.portal_vm_memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.portal_root_disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = false # Прямого доступа из интернета к порталу нет (только через корпоративный VPN/Gateway)
  }

  metadata = {
    # ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}

# VM 2: Движок обработки данных и витрин (Trino / Аналитический слой)
resource "yandex_compute_instance" "processing_vm" {
  name        = "future20-analytics-processing"
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.processing_vm_cores
    memory = var.processing_vm_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10 # значение уменьшено для лимитов учебного проекта
      type     = "network-hdd"
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.processing_data_disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = false
  }

  metadata = {
    # ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}