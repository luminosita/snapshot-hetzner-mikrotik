build {
  name = "vanilla"
  sources = ["source.hcloud.vanilla"]

  provisioner "shell" {
    inline = [
      "curl -L ${local.image} > mikrotik-chr.zip",
      "funzip mikrotik-chr.zip > mikrotik-chr.img",
      "dd if=mikrotik-chr.img of=/dev/sda bs=1M"
    ]
  }
}

build {
  name = "final"
  sources = ["source.hcloud.final"]

  provisioner "shell-local" {
    inline = [
      ""
    ]
  }
}