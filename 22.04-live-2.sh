#!/bin/bash
vg=$( sudo vgs --noheading -o vg_name | tr -d '  ' )
echo $vg
sudo mkdir -p /media/root
sudo mount /dev/${vg}/root /media/root
sudo mkdir -p /media/programs
sudo mount /dev/${vg}/programs /media/programs
sudo mkdir -p /media/root/programs
sudo mkdir /media/programs/snap
sudo mkdir /media/programs/snapd
sudo mv /media/root/snap/* /media/programs/snap/
sudo mv /media/root/var/lib/snapd/* /media/programs/snapd/
sudo mv /media/root/var/lib/flatpak /media/programs/
sudo ln -s /programs/flatpak /media/root/var/lib/flatpak
sudo ln -s /programs/snapd /media/root/var/lib/snapd
sudo su -c 'echo "/programs/snap /snap   none    bind    0   0" >> /media/root/etc/fstab'
