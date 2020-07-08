#!/usr/bin/bash

#If you would like to update this box to more recent, just run the below provisioning script accordingly

echo "Updating system packages"
apt-get -y update
apt-get -y upgrade
apt-get -y install wget software-properties-common zip unzip vim

# Install AdopeOpenJDK Java Development Kit and Runtime
echo "Installing AdoptOpenJDK - See: https://adoptopenjdk.net"
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
apt-get -y update
apt-get -y install adoptopenjdk-11-hotspot adoptopenjdk-11-hotspot-jre

#Add java to the bash environment
#echo 'export PATH=/opt/jdk-11.0.3/bin:$PATH' >> /home/vagrant/.bashrc

#Install Ghidra to /opt
echo "Installing Ghidra - See: https://ghidra-sre.org"
VERSION="ghidra_9.1.2_PUBLIC_20200212.zip"
GHIDRA_URL="https://ghidra-sre.org/$VERSION"

#Don't re-download the ghidra zip unless we have to 
if [ ! -f $VERSION ]; then wget -O $VERSION --progress=bar:force $GHIDRA_URL; fi
chown vagrant:vagrant $VERSION
cd /opt
unzip -o /home/vagrant/$VERSION
install_directory=`ls -1 | egrep ghidra_`
rm -f ghidra; ln -s $install_directory ghidra

#Create a desktop icon/launcher
cp /vagrant/bootstrap/ghidra-9.desktop /home/vagrant/Desktop/
chown vagrant:vagrant /home/vagrant/Desktop/ghidra-9.desktop

#Copy png icon to ghidra as original icon format is not supported by XFCE
if [ ! -d /home/vagrant/.icons ]; then mkdir /home/vagrant/.icons; fi
chown vagrant:vagrant /home/vagrant/.icons
cp /vagrant/bootstrap/ghidra.png /home/vagrant/.icons/
chown vagrant:vagrant /home/vagrant/.icons/ghidra.png



