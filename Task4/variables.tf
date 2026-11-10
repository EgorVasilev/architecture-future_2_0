variable "cloud_id" {
  description = "ID облака в Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога в Yandex Cloud"
  type        = string
}

variable "zone" {
  description = "Зона доступности для развертывания аналитики"
  type        = string
  default     = "ru-central1-a"
}

variable "portal_vm_cores" {
  description = "Количество ядер для VM портала самообслуживания"
  type        = number
  default     = 4
}

variable "portal_vm_memory" {
  description = "Оперативная память для VM портала (ГБ)"
  type        = number
  default     = 8
}

variable "processing_vm_cores" {
  description = "Количество ядер для движка ClickHouse"
  type        = number
  default     = 16
}

variable "processing_vm_memory" {
  description = "Оперативная память для движка обработки данных (ГБ)"
  type        = number
  default     = 32
}