---
title: "MocaccinoOS v1.8.1"
linkTitle: "MocaccinoOS v1.8.1"
date: 2025-02-13
description: >-
     MocaccinoOS v1.8.1 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.8.1

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.  
With kind regards,  

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost  

### Changes since 1.7.1:

- Cosmic DE Alpha5 version (available in repository)
- Kernel is upgraded to 6.6.75 (LTS)
- Mesa version 24.3.3
- Nvidia-drivers version 550.144.03 (available in repository) 
- KDE Plasma 6.2.5
- XFCE 4.20
- Steam™ dropped from iso (available in repository) 

### Issues and improvements:

- Implement performance tuning, see documentation. (https://www.mocaccino.org/docs/desktop/performance)
- XFCE theme improvements
- Calamares several small issues fixed
- Better support for touchpad devices (https://github.com/mocaccinoOS/desktop/commit/de2820722596c8fed8377895166e9e3d4fab8a05)
- Better support for Intel ARC GPU (https://github.com/mocaccinoOS/desktop/commit/a2cac3fe0a51af5d735164bc3e7a5776f16b32bb)
- We are aware that MOS images are not fully EFI complaint, certain (mostly older) systems are not booting properly with EFISTUB used in our images. At the moment we do not have a proper solution and the workaround is to change your BIOS settings to boot in legacy mode. ( https://github.com/mocaccinoOS/mocaccino/issues/130 )

### Notes for testers:

Additional software can be installed through flatpak, docker or the community repository.
Please give us feedback by reporting bugs or sharing your ideas with us.
Check out our [documentation](https://www.mocaccino.org/docs/) pages

### Support our work!

https://www.mocaccino.org/docs/donate/

### Acknowledgement:
The project heavily depends on the work done by upstream [Gentoo Linux](https://gentoo.org) and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by [Kairos](https://kairos.io).

### Download

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.

### Screenshots

![XFCE_1](https://github.com/user-attachments/assets/01b29c8d-deef-471c-86ad-dd948d5c8832)  
![XFCE_2](https://github.com/user-attachments/assets/2b5ccc31-2e94-4f92-90f8-b6241470e599)  
![XFCE_3](https://github.com/user-attachments/assets/024dff69-c9ab-4da7-8266-3fa67c35ccd2)  
![KDE_1](https://github.com/user-attachments/assets/daf2a64e-04b9-4d87-9215-659852a59892)  
![KDE_2](https://github.com/user-attachments/assets/094becb0-1d41-4d03-bf99-258fd7e15208)  
![KDE_3](https://github.com/user-attachments/assets/363475b1-323a-47c2-8c35-f412a497bb84)  
