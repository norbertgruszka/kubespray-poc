# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  (0..0).each do |i|
    config.vm.define "k8s-master-#{i}" do |node|
      node.vm.network :private_network, ip: "192.168.60.#{i+32}"
      node.vm.hostname = "k8s-master-#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
      end
    end
  end

  (0..0).each do |i|
    config.vm.define "k8s-worker-#{i}" do |node|
      node.vm.network :private_network, ip: "192.168.60.#{i+64}"
      node.vm.hostname = "k8s-worker-#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "4096"
      end
    end
  end

  ssh_pub_key = File.readlines("./ssh/id_rsa.pub").first.strip
  config.vm.provision 'shell', inline: 'mkdir -p /root/.ssh'
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /root/.ssh/authorized_keys"
  config.vm.provision 'shell', inline: "echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys", privileged: false
end

