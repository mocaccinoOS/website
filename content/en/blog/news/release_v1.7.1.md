---
title: "MocaccinoOS v1.7.1"
linkTitle: "MocaccinoOS v1.7.1"
date: 2024-09-21
description: >-
     MocaccinoOS v1.7.1 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.7.1
(_This revision fixes a tiny bug that was annoying enough to make this revision, see_ https://github.com/mocaccinoOS/mocaccino/issues/142 )

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.  
With kind regards,  

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost  

### Changes since 1.6

- Cosmic DE Alpha1 version (available in repository)
- Kernel is upgraded to 6.6.51 (LTS)
- Mesa version 24.1.6
- Nvidia-drivers version 550.107.02 (available in repository) 
- KDE Plasma 6.1.4
- Calamares installer is updated to version 3.3.6
- Iso images now ship with Steam™ preinstalled

### Issues and improvements

- Our custom Plymouth theme has been added to stable iso images
- Prepare support for Bcachefs.  Tools have been added, kernel support will follow  ( https://github.com/mocaccinoOS/mocaccino/issues/139 )
- We are aware that MOS images are not fully EFI complaint, certain (mostly older) systems are not booting properly with EFISTUB used in our images. At the moment we do not have a proper solution and the workaround is to change your BIOS settings to boot in legacy mode. ( https://github.com/mocaccinoOS/mocaccino/issues/130 )

### Notes for testers:

Additional software can be installed through flatpak, docker or the community repository.
Please give us feedback by reporting bugs or sharing your ideas with us.
Check out our [documentation](https://www.mocaccino.org/docs/) pages

### Support our work!

https://www.mocaccino.org/docs/donate/

### Acknowledgement:
The project heavily depends on the work done by upstream [Gentoo Linux](https://gentoo.org) and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by Kairos.

### Download

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.
