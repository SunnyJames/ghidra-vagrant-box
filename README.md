# ghidra-vagrant box

This vagrant configuration creates a virtual machine and installs the prerequisites for the Ghidra reverse engineering toolkit.

The base box can be modified or replaced with an alternative according to your needs.  The installation script currently assumes a Debian-based system, so the provisioning script may need modified depending on package distribution particulars for your Linux.  Just modifify the 'config.vm.box' to be the desired base box for your install.  The provided box is a barebones install of Debian-Buster with the XFCE desktop.  NO additional packages or configuration was performed outside of the basics for Vagrant and VirtualBox Guest Additions. 


### Host Computer Pre-requisites
1. Probably a Linux/Unix, but Windows may work fine... not tested
2. VirtualBox >= 6.1.10 -- <https://www.virtualbox.org/wiki/Downloads>
3. VirtualBox Extensions Pack >= 6.1.10 -- <https://www.virtualbox.org/wiki/Downloads>
4. vagrant >= 2.2.9 -- <https://www.vagrantup.com/downloads.html>
5. vagrant vbguest plugin -- 
    - `> vagrant plugin install vagrant-vbguest`
6. Access to the internet for Ghidra packages and pre-requisites:
    - Vagrant Cloud - <https://app.vagrantup.com>
    - Debian Linux - <https://www.debian.org>
    - AdoptOpenJDK - <https://adoptopenjdk.net>
    - Ghidra - <https://ghidra-sre.org>


### Getting Started
Vagrant should take care of downloading the basebox from VagrantCloud, updating the Debian operating system packages, updating VirtualBox Guest Additions if required.  After running "vagrant up" and the virtual machine is finished building you should be presented with a running virtual machine in Virtualbox.  The default vagrant username and password is "vagrant:vagrant".  In some cases guest additions in the box may be stale and you may have to restart the VM to get the guest additions to be properly upgraded.  You can do this with "vagrant halt; vagrant up; vagrant vbguest". 


### Using the Pre-built Vagrant box with Ghidra 9
1. Create a directory on your host computer for your vagrant instance: mkdir ghidra-vagrant
2. You can use the Vagrant Cloud hosted copy or a local copy of the vagrant box.  
    - If using a local copy of the vagrant box: 
    - `> vagrant add solarium/Ghidra-9-Debian-Buster-xfce Ghidra-9-Debian-Buster-xfce.box`
3. Run vagrant init: 
    - `> vagrant init solarium/Ghidra-9-Debian-Buster-xfce`
4. Run vagrant up: 
    - `> vagrant up`
5. Desktop environment should show up. If not switch to VirtualBox and click "Show"
6. Ghidra desktop icin should show up on the desktop
7. Ghidra can also be run from the command line: 
    - `> cd /opt/ghidra; ghidra-run.sh`



### Alternative Install: To create a new box with Ghidra using a script:
- Create your own vagrant box or import a suitable box with a desktop environment.
- The Vagrant base-box used in our build is: solarium/debian-buster-xfce
    - `> mkdir my-ghidra-vm`
    - `> vagrant init solarium/debian-buster-xfce`
    - `> vagrant up`
    - `> ./InstallGhidra.sh`
- If you would rather install manually instead of using the script, visit the Ghidra website for instructions.
    - <https://ghidra-sre.org>


### Re-Package Your Updated Box
- Install Ghidra in your own Linux environment, using one of the above or manually
- Clean and minimize the size of the virtual machine disk
    - `> vagrant up; vagrant ssh; sudo /vagrant/bootstrap/clean.sh;`
- Package the updated box
    - `> vagrant package --vagrantfile BoxVagrantfile`
    - The 'BoxVagrantFile` provides the default settings (such as to show the GUI) which can be overridden or modified as needed.

