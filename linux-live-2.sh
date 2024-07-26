#!/bin/bash
vg=$( sudo vgs --noheading -o vg_name | tr -d '  ' )
echo $vg
sudo mkdir -p /media/root
sudo mount /dev/${vg}/root /media/root
sudo mkdir -p /media/programs
sudo mount /dev/${vg}/programs /media/programs
sudo mkdir -p /media/root/programs/
sudo mv /media/root/var/lib/flatpak /media/programs/var/lib/
sudo ln -s /programs/var/lib/flatpak /media/root/var/lib/flatpak
if [ -f "/usr/bin/snap" ] 
then
  sudo mkdir /media/programs/snap
  sudo mkdir -p /media/programs/var/lib/snapd
  sudo mkdir -p /media/programs/var/snap
  sudo mv /media/root/snap/* /media/programs/snap/
  sudo mv /media/root/var/lib/snapd/* /media/programs/var/lib/snapd
  sudo mv /media/root/var/snap/* /media/programs/var/snap
  sudo su -c 'echo "/programs/snap /snap   none    bind    0   0" >> /media/root/etc/fstab'
  sudo su -c 'echo "/programs/var/lib/snapd /var/lib/snapd none    bind    0   0" >> /media/root/etc/fstab'
  sudo su -c 'echo "/programs/var/snap /var/snap none    bind    0   0" >> /media/root/etc/fstab'
fi
