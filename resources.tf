resource "yandex_compute_disk" "test" {
  name     = "test"
  type     = "network-hdd"
  zone     = "ru-central1-a"
  image_id = "fd8ba9d5mfvlncknt2kd"

  labels = {
    environment = "netology"
  }
}

resource "yandex_vpc_address" "addr" {
  name = "external-ip-vm"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_compute_instance" "test" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.test.id
  }

  network_interface {
    subnet_id = "e9b1tfv7q6ul6e1ful7j"
    nat = true
    nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address

  }

  metadata = {
    user-data = "${file("./cloud-conf.yaml")}"
  }
}
