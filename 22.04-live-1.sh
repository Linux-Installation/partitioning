#!/bin/bash
vg="ubuntu-mate"
partition="/dev/sda2"
sudo pvcreate $partition
sudo vgcreate $vg $partition
sudo lvcreate -L 33G -n root $vg
sudo lvcreate -L 33G -n programs $vg
sudo lvcreate -L 1G -n swap $vg
sudo lvcreate -l 80%FREE -n home $vg
