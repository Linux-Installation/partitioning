#!/bin/bash
vg=$( sudo vgs --noheading -o vg_name | tr -d '  ' )
echo $vg
sudo mkdir -p /media/root
sudo mount /dev/${vg}/root /media/root
sudo mkdir -p /media/programs
sudo mount /dev/${vg}/programs /media/programs
sudo mkdir -p /media/root/programs/var-lib/
sudo mkdir /media/programs/snap
sudo mv /media/root/snap/* /media/programs/snap/
sudo mv /media/root/var/lib/flatpak /media/programs/
sudo mv /media/root/var/lib/snapd/* /media/programs/var-lib/snapd
sudo mv /media/root/var/lib/snap/* /media/programs/var-lib/snap
sudo ln -s /programs/var-lib/flatpak /media/root/var/lib/flatpak
sudo su -c 'echo "/programs/snap /snap   none    bind    0   0" >> /media/root/etc/fstab'
sudo su -c 'echo "/programs/var-lib/snapd /var/lib/snapd none    bind    0   0" >> /media/root/etc/fstab'
sudo su -c 'echo "/programs/var-lib/snap /var/lib/snap none    bind    0   0" >> /media/root/etc/fstab'
