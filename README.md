# Ubuntu-Installation - Partitioning
## Why
This shell script is for partitioning of LVM Installations.
The Ubuntu Installer didn't allow self-partitioning of LVM Installations.
But i want to split some things like the home directory for easier changes afterwards.

## What is the partitioning
| Amount of Space  | Purpose |
| ---------------  | ------- |
| 30 GB            | / (root)    |
| 10 GB            | /programs (For flatpak and snap)    |
| 1  GB            | swap   |
| other free space | /home    |

## How to Use
If you already have created LVM partitions e.g. from Ubuntu 20.04, then you can skip until 4.
In the Ubuntu Live Environment:
1. create 2 Partitions without a file system
1.1. One should be 1GB Big (efi Partition)
1.2. The other one should be the free space which is left.
2. Edit script 22.04-live-1.sh and insert the variable partition. Put in the location of the in 1.2 created partition. (biggest one)
3. execute 22.04-live-1.sh (This will create 4 LV root, home, programs, swap)
4. Start Installation 
4.1. choose root as Mount Point /
4.2. choose programs as Mount Point /programs
4.3. choose swap as swap
4.4. choose home as Mount Point /home
5. After Installation execute 22.04-live-1.sh (This will change that flatpak and snap make use of the programs partition)

( If you use a USB-Stick with [Ventoy](https://github.com/ventoy), you can Inject the script file in the Ubuntu Live Enviroment -> https://www.ventoy.net/en/doc_live_injection.html )

## [Optional] Ventoy Liveinjection
The partition-vX.tar.gz file is ready for use with ventoy. (The File will appear in /home [Thats because every distribution has it's own username])
Just create on the ISO Partition a directory ventoy and create a File named ventoy.json with a content like this
```
{
    "injection": [
        {
            "image": "/nameofyouriso.iso",
            "archive": "/partition-vX.tar.gz"
        }
    ]
}
```
replace nameofyouriso with the name of your iso file and partition-vX with your actual version!
Copy your iso and the partition-vX.tar.gz to the iso Partition.

## TODO
- [ ] [Make root size customizable](https://github.com/Ubuntu-Installation/partitioning/issues/1)
- [ ] [Make programs size customizable](https://github.com/Ubuntu-Installation/partitioning/issues/2)
