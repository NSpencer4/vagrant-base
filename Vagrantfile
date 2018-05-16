Vagrant.configure("2") do |config|
    config.vm.hostname = "vagrant-base"
    config.ssh.insert_key = false
    config.ssh.forward_agent = true

    config.vm.box = "ubuntu/trusty64"
    config.vm.network :forwarded_port, guest: 80, host: 2300
    config.vm.network :forwarded_port, guest: 443, host: 2500
    config.vm.network "private_network", ip: "192.168.88.88"
    config.vm.synced_folder "", "/var/www/vagrant-base"
#    if Vagrant.has_plugin?('vagrant-hostsupdater')
#        config.hostsupdater.aliases = ['']
#    end
    config.vm.provision "shell", path: "environment/scripts/provisioner.sh"

    # VirtualBox.
    config.vm.provider :virtualbox do |v|
      v.linked_clone = false
      v.name = "vagrant-base"
      v.memory = 1024
      v.cpus = 1
      v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      v.customize ['modifyvm', :id, '--ioapic', 'on']
      v.gui = false
    end
end
