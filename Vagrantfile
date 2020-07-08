# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "solarium/debian-buster-xfce"
    config.vm.box_check_update = false

    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = true
  
        # Customize the amount of memory on the VM:
        vb.memory = "4096"
        vb.customize ["modifyvm", :id, "--vram", "32"] 
    end

    config.vm.provision "shell", path: "bootstrap/InstallGhidra.sh"
end
