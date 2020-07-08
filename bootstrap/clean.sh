#!/bin/bash

echo "Minimize package repositories"
apt-get -y autoremove

echo "Remove bash history"
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history

echo "Zero out disk"
dd if=/dev/zero of=/EMPTY bs=1M
sync
rm -f /EMPTY
sync

echo "Vagrant cleanup complete!"
