# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  (0..1).each do |i|
    config.vm.define "k8s-master-#{i}" do |node|
      node.vm.network :private_network, ip: "192.168.60.#{i+32}"
      node.vm.hostname = "k8s-master-#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
  end

  (0..3).each do |i|
    config.vm.define "k8s-worker-#{i}" do |node|
      node.vm.network :private_network, ip: "192.168.60.#{i+64}"
      node.vm.hostname = "k8s-worker-#{i}"
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
  end
end
