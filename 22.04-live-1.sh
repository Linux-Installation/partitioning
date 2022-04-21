#!/bin/bash
vg="ubuntu-mate"
partition="/dev/sda2"
pvcreate $partition
vgcreate $vg $partition
sudo lvcreate -L 30G -n root $vg
sudo lvcreate -L 10G -n programs $vg
sudo lvcreate -L 1G -n swap $vg
sudo lvcreate -l 100%FREE -n home $vg
