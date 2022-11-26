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

  config.vm.provision "shell" do |s|
    s.inline = <<-SCRIPT
      set -xue
  
      export DEBIAN_FRONTEND=noninteractive
      
      apt-get update
      apt-get install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

      mkdir /python
      cd /python
      wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz
      tar -xvf Python-3.10.0.tgz
      cd Python-3.10.0
      ./configure --enable-optimizations
      make install
      python3 --version
      python --version
    SCRIPT
  end
end
