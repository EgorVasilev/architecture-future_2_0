`terraform init`:

```bash

egor@egor-desktop:~/Documents/yandex_practicum/architecture/architecture-future_2_0/Task4$ terraform init
Initializing the backend...

Initializing provider plugins...
- Finding latest version of yandex-cloud/yandex...
- Installing yandex-cloud/yandex v0.245.0...
- Installed yandex-cloud/yandex v0.245.0 (unauthenticated)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Incomplete lock file information for providers
│ 
│ Due to your customized provider installation methods, Terraform was forced to
│ calculate lock file checksums locally for the following providers:
│   - yandex-cloud/yandex
│ 
│ The current .terraform.lock.hcl file only includes checksums for linux_amd64,
│ so Terraform running on another platform will fail to install these
│ providers.
│ 
│ To calculate additional checksums for another platform, run:
│   terraform providers lock -platform=linux_amd64
│ (where linux_amd64 is the platform to generate)
╵
Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```


`terraform plan`:

```bash

egor@egor-desktop:~/Documents/yandex_practicum/architecture/architecture-future_2_0/Task4$ terraform plan
data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu: Read complete after 0s [id=fd87v9u6g814jeosoe8v]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_disk.portal_root_disk will be created
  + resource "yandex_compute_disk" "portal_root_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "portal-root-disk"
      + product_ids = (known after apply)
      + size        = 6
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # yandex_compute_disk.processing_data_disk will be created
  + resource "yandex_compute_disk" "processing_data_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "processing-data-disk"
      + product_ids = (known after apply)
      + size        = 6
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # yandex_compute_instance.portal_vm will be created
  + resource "yandex_compute_instance" "portal_vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + name                      = "future20-data-portal"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + reserved_instance_pool_id = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params (known after apply)
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = false
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)
    }

  # yandex_compute_instance.processing_vm will be created
  + resource "yandex_compute_instance" "processing_vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + name                      = "future20-analytics-processing"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + reserved_instance_pool_id = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd87v9u6g814jeosoe8v"
              + name        = (known after apply)
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = false
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)

      + secondary_disk {
          + auto_delete = false
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = "READ_WRITE"
        }
    }

  # yandex_vpc_gateway.nat_gw will be created
  + resource "yandex_vpc_gateway" "nat_gw" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + labels     = (known after apply)
      + name       = "analytics-nat-gateway"

      + shared_egress_gateway {}
    }

  # yandex_vpc_network.analytics_net will be created
  + resource "yandex_vpc_network" "analytics_net" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "future20-analytics-network"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_route_table.nat_route will be created
  + resource "yandex_vpc_route_table" "nat_route" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + labels     = (known after apply)
      + name       = "analytics-nat-route-table"
      + network_id = (known after apply)

      + static_route {
          + destination_prefix = "0.0.0.0/0"
          + gateway_id         = (known after apply)
            # (1 unchanged attribute hidden)
        }
    }

  # yandex_vpc_subnet.private_subnet will be created
  + resource "yandex_vpc_subnet" "private_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "analytics-private-subnet"
      + network_id     = (known after apply)
      + route_table_id = (known after apply)
      + v4_cidr_blocks = [
          + "10.100.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # yandex_vpc_subnet.public_subnet will be created
  + resource "yandex_vpc_subnet" "public_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "analytics-public-subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.100.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 9 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + network_id            = (known after apply)
  + portal_private_ip     = (known after apply)
  + processing_private_ip = (known after apply)

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if
you run "terraform apply" now.



```

`terraform apply`:

```bash

egor@egor-desktop:~/Documents/yandex_practicum/architecture/architecture-future_2_0/Task4$ terraform apply
data.yandex_compute_image.ubuntu: Reading...
data.yandex_compute_image.ubuntu: Read complete after 1s [id=fd87v9u6g814jeosoe8v]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with
the following symbols:
  + create

Terraform will perform the following actions:

  # yandex_compute_disk.portal_root_disk will be created
  + resource "yandex_compute_disk" "portal_root_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "portal-root-disk"
      + product_ids = (known after apply)
      + size        = 6
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # yandex_compute_disk.processing_data_disk will be created
  + resource "yandex_compute_disk" "processing_data_disk" {
      + block_size  = 4096
      + created_at  = (known after apply)
      + folder_id   = (known after apply)
      + id          = (known after apply)
      + name        = "processing-data-disk"
      + product_ids = (known after apply)
      + size        = 6
      + status      = (known after apply)
      + type        = "network-hdd"
      + zone        = "ru-central1-a"

      + disk_placement_policy (known after apply)

      + hardware_generation (known after apply)
    }

  # yandex_compute_instance.portal_vm will be created
  + resource "yandex_compute_instance" "portal_vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + name                      = "future20-data-portal"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + reserved_instance_pool_id = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params (known after apply)
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = false
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)
    }

  # yandex_compute_instance.processing_vm will be created
  + resource "yandex_compute_instance" "processing_vm" {
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hardware_generation       = (known after apply)
      + hostname                  = (known after apply)
      + id                        = (known after apply)
      + maintenance_grace_period  = (known after apply)
      + maintenance_policy        = (known after apply)
      + name                      = "future20-analytics-processing"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v3"
      + reserved_instance_pool_id = (known after apply)
      + status                    = (known after apply)
      + zone                      = "ru-central1-a"

      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)

          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd87v9u6g814jeosoe8v"
              + name        = (known after apply)
              + size        = 10
              + snapshot_id = (known after apply)
              + type        = "network-hdd"
            }
        }

      + metadata_options (known after apply)

      + network_interface {
          + index          = (known after apply)
          + ip_address     = (known after apply)
          + ipv4           = true
          + ipv6           = (known after apply)
          + ipv6_address   = (known after apply)
          + mac_address    = (known after apply)
          + nat            = false
          + nat_ip_address = (known after apply)
          + nat_ip_version = (known after apply)
          + subnet_id      = (known after apply)
        }

      + placement_policy (known after apply)

      + resources {
          + core_fraction = 100
          + cores         = 2
          + memory        = 4
        }

      + scheduling_policy (known after apply)

      + secondary_disk {
          + auto_delete = false
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = "READ_WRITE"
        }
    }

  # yandex_vpc_gateway.nat_gw will be created
  + resource "yandex_vpc_gateway" "nat_gw" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + labels     = (known after apply)
      + name       = "analytics-nat-gateway"

      + shared_egress_gateway {}
    }

  # yandex_vpc_network.analytics_net will be created
  + resource "yandex_vpc_network" "analytics_net" {
      + created_at                = (known after apply)
      + default_security_group_id = (known after apply)
      + folder_id                 = (known after apply)
      + id                        = (known after apply)
      + labels                    = (known after apply)
      + name                      = "future20-analytics-network"
      + subnet_ids                = (known after apply)
    }

  # yandex_vpc_route_table.nat_route will be created
  + resource "yandex_vpc_route_table" "nat_route" {
      + created_at = (known after apply)
      + folder_id  = (known after apply)
      + id         = (known after apply)
      + labels     = (known after apply)
      + name       = "analytics-nat-route-table"
      + network_id = (known after apply)

      + static_route {
          + destination_prefix = "0.0.0.0/0"
          + gateway_id         = (known after apply)
            # (1 unchanged attribute hidden)
        }
    }

  # yandex_vpc_subnet.private_subnet will be created
  + resource "yandex_vpc_subnet" "private_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "analytics-private-subnet"
      + network_id     = (known after apply)
      + route_table_id = (known after apply)
      + v4_cidr_blocks = [
          + "10.100.1.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

  # yandex_vpc_subnet.public_subnet will be created
  + resource "yandex_vpc_subnet" "public_subnet" {
      + created_at     = (known after apply)
      + folder_id      = (known after apply)
      + id             = (known after apply)
      + labels         = (known after apply)
      + name           = "analytics-public-subnet"
      + network_id     = (known after apply)
      + v4_cidr_blocks = [
          + "10.100.2.0/24",
        ]
      + v6_cidr_blocks = (known after apply)
      + zone           = "ru-central1-a"
    }

Plan: 9 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + network_id            = (known after apply)
  + portal_private_ip     = (known after apply)
  + processing_private_ip = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

yandex_vpc_gateway.nat_gw: Creating...
yandex_vpc_network.analytics_net: Creating...
yandex_compute_disk.portal_root_disk: Creating...
yandex_compute_disk.processing_data_disk: Creating...
yandex_vpc_gateway.nat_gw: Creation complete after 1s [id=enpkq1e698hpmvo7il5j]
yandex_vpc_network.analytics_net: Creation complete after 3s [id=enpau1edffb8c5dio0q4]
yandex_vpc_subnet.public_subnet: Creating...
yandex_vpc_route_table.nat_route: Creating...
yandex_vpc_subnet.public_subnet: Creation complete after 1s [id=e9bh8eppd0pn8emfh7br]
yandex_vpc_route_table.nat_route: Creation complete after 1s [id=enp2dbffknb1blrfla3t]
yandex_vpc_subnet.private_subnet: Creating...
yandex_vpc_subnet.private_subnet: Creation complete after 1s [id=e9bn615aqd98h0sf2u8f]
yandex_compute_disk.portal_root_disk: Creation complete after 7s [id=fhmqj6lked1bb3icscbm]
yandex_compute_instance.portal_vm: Creating...
yandex_compute_disk.processing_data_disk: Still creating... [00m10s elapsed]
yandex_compute_disk.processing_data_disk: Creation complete after 11s [id=fhmdidcmf3gushq41o3h]
yandex_compute_instance.processing_vm: Creating...
yandex_compute_instance.portal_vm: Still creating... [00m10s elapsed]
yandex_compute_instance.processing_vm: Still creating... [00m10s elapsed]
yandex_compute_instance.portal_vm: Still creating... [00m20s elapsed]
yandex_compute_instance.processing_vm: Still creating... [00m20s elapsed]
yandex_compute_instance.portal_vm: Still creating... [00m30s elapsed]
yandex_compute_instance.processing_vm: Still creating... [00m30s elapsed]
yandex_compute_instance.portal_vm: Creation complete after 35s [id=fhmorurd9svfe3jgee8u]
yandex_compute_instance.processing_vm: Still creating... [00m40s elapsed]
yandex_compute_instance.processing_vm: Creation complete after 42s [id=fhmqebn5346alr776cvb]

Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:

network_id = "enpau1edffb8c5dio0q4"
portal_private_ip = "10.100.1.5"
processing_private_ip = "10.100.1.10"


```