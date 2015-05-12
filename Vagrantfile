# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-64-x64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box"

  config.vm.provision :shell, :path => "bootstrap.sh"
  
  # forward the yarn admin port
  config.vm.network "forwarded_port", guest: 4040, host: 4040, auto_correct: true
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
  config.vm.network "forwarded_port", guest: 8081, host: 8081, auto_correct: true
  config.vm.network "forwarded_port", guest: 8088, host: 8088, auto_correct: true
  config.vm.network "forwarded_port", guest: 8787, host: 8787, auto_correct: true
  config.vm.network "forwarded_port", guest: 8042, host: 8042, auto_correct: true
  config.vm.network "forwarded_port", guest: 19888, host: 19888, auto_correct: true
  config.vm.network "forwarded_port", guest: 50070, host: 50070, auto_correct: true
  config.vm.network "forwarded_port", guest: 50075, host: 50075, auto_correct: true

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "8192"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]  
  end
  
end
