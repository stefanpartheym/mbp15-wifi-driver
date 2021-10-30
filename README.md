# mbp15-wifi-driver

This repository provides scripts to make the installation process of the wifi driver files of the MacBookPro15,2 in Linux more convenient.
(Tested only in ArchLinux)

---

- In MacOS:
  - execute the `collect.sh` script to collect the required driver files - requires Node.js installation (containing `npx` - default since Node.js 9.4.0),
  - copy resulting `driver-files` to drive shared with Linux, e.g. USB stick.
- On Linux:
  - either:
    - copy `driver-files` from shared drive to this repo, or
    - download the required files by executing the `download.sh` script,
  - execute the `install.sh` script, which copies the previously collected or downloaded files to the correct location in your Linux system.
