# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
cd /app
./mvnw clean spring-boot:run
SCRIPT

Vagrant.configure("2") do |config|

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false

  config.vm.define 'spring-boot' do |machine|
    
    machine.vm.hostname = "spring-boot.demo"

    machine.vm.box = "ubuntu/bionic64"

    machine.vm.synced_folder '.', '/vagrant', disabled: true
    machine.vm.synced_folder '.', '/app'
    machine.vm.synced_folder '~/.m2', '/home/vagrant/.m2'

    machine.vm.provider 'virtualbox' do |vb, override|
      vb.name = machine.vm.hostname
      vb.cpus = 2
      vb.memory = 1024

      override.vm.network :private_network, ip: '192.168.50.100'

    end

    machine.vm.provision 'install', type: :shell, path: './scripts/install.sh'
    machine.vm.provision 'spring-boot:run', type: :shell, run: :always, inline: $script

  end

end
