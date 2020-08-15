# mbp15-wifi-driver

This repository provides scripts to make the installation process of the wifi driver files of the MacBookPro15,2 in Linux more convenient.
(Tested only in ArchLinux)

---

- In MacOS, install `json` through `npm`: `npm install -g json`. Then execute the `collect.sh` script to collect the required driver files. (Alternatively you might as well download the required files by executing the `download.sh` script)
- Boot your Linux OS
- execute the `install.sh` script, which copies the previously collected or downloaded files to the correct location in your Linux system.
