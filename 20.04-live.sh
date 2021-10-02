#!/bin/bash
vg=$( sudo vgs --noheading -o vg_name | tr -d '  ' )
echo $vg
sudo lvreduce --resizefs -L 30G /dev/$vg/root 
sudo lvcreate -L 10G -n programs $vg
sudo mkfs.ext4 /dev/${vg}/programs
sudo lvcreate -l 100%FREE -n home $vg
sudo mkfs.ext4 /dev/${vg}/home
sudo mkdir -p /media/root
sudo mount /dev/${vg}/root /media/root
sudo mkdir -p /media/home
sudo mount /dev/${vg}/home /media/home
sudo mv /media/root/home/* /media/home/
sudo mkdir -p /media/programs
sudo mount /dev/${vg}/programs /media/programs
sudo mkdir -p /media/root/programs
sudo mkdir /media/programs/snap
sudo mv /media/root/snap/* /media/programs/snap/*
sudo su -c 'echo "/dev/'$vg'/home /home ext4 defaults 0   2" >> /media/root/etc/fstab'
sudo su -c 'echo "/dev/'$vg'/programs /programs ext4 defaults 0   1" >> /media/root/etc/fstab'
sudo su -c '/programs/snap /snap   none    bind    0   0" >> /media/root/etc/fstab'
sudo ln -s /media/programs/flatpak /media/root/var/lib/flatpak
