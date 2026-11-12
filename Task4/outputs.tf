output "portal_private_ip" {
  description = "Внутренний IP-адрес портала самообслуживания для корпоративной сети"
  value       = yandex_compute_instance.portal_vm.network_interface[0].ip_address
}

output "processing_private_ip" {
  description = "Внутренний IP-адрес распределенного движка аналитики"
  value       = yandex_compute_instance.processing_vm.network_interface[0].ip_address
}

output "network_id" {
  description = "ID созданной VPC сети аналитики холдинга"
  value       = yandex_vpc_network.analytics_net.id
}