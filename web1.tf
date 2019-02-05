resource "digitalocean_droplet" "web1" {
  image = "ubuntu-16-04-x64"
  name = "web1"
  region = "nyc2"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]
  connection {
    user = "codeChris"
    type = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout = "2m"
  }
  provisioner "remote_exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      #install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
      ]
    }
}
