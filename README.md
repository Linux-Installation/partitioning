# Ubuntu-Installation - Partitioning
## Why
This shell script is for partitioning of LVM Installation.
The Ubuntu Installer didn't allow self-partitioning of LVM Installations.
But i want to split some things like the home directory for easier changes afterwards.

## What is the partitioning
| Amount of Space  | Purpose |
| ---------------  | ------- |
| 30 GB            | / (root)    |
| 10 GB            | /programs (For flatpak and snap)    |
| other free space | /home    |

## How to Use
When you want to use this script you should choose LVM while Installing Ubuntu.
After the Installation of Ubuntu execute the script in the Ubuntu Live Environment
( If you use a USB-Stick with [Ventoy](https://github.com/ventoy), you can Inject the script file in the Ubuntu Live Enviroment -> https://www.ventoy.net/en/doc_live_injection.html )

## TODO
- [ ] https://github.com/Ubuntu-Installation/partitioning/issues/1
- [ ] https://github.com/Ubuntu-Installation/partitioning/issues/2
