---
title: "MocaccinoOS v1.8.2"
linkTitle: "MocaccinoOS v1.8.2"
date: 2025-05-09
description: >-
     MocaccinoOS v1.8.2 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.8.2

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.  
With kind regards,  

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost  

### Changes since 1.8.1

- Cosmic DE Alpha7 version (available in repository)
- Kernel is upgraded to 6.12.15 (LTS)
- Mesa version 25.0.4
- Nvidia-drivers version 570.133.07 (available in repository) 
- KDE Plasma 6.3.4
- GNOME 47

### Issues and improvements

- Improved documentation
- Better support for Intel Xe GPU (https://github.com/mocaccinoOS/desktop/commit/42bede49beaea7e5459122a71b37f280b4d6461f)
- We are aware that MOS images are not fully EFI complaint, certain (mostly older) systems are not booting properly with EFISTUB used in our images. At the moment we do not have a proper solution and the workaround is to change your BIOS settings to boot in legacy mode. ( https://github.com/mocaccinoOS/mocaccino/issues/130 )

### Notes for testers

Additional software can be installed through flatpak, docker or the community repository.
Please give us feedback by reporting bugs or sharing your ideas with us.
Check out our [documentation](https://www.mocaccino.org/docs/) pages

### Support our work!

https://www.mocaccino.org/docs/donate/

### Acknowledgement
The project heavily depends on the work done by upstream [Gentoo Linux](https://gentoo.org) and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by [Kairos](https://kairos.io).

### Download

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.
