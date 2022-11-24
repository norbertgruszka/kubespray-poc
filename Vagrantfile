# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  config.vm.define "k8s-master" do |node|
    node.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end

  (1..3).each do |i|
    config.vm.define "k8s-node-#{i}" do |node|
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
      end
    end
  end
end
