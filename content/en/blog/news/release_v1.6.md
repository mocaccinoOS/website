---
title: "MocaccinoOS v1.6"
linkTitle: "MocaccinoOS v1.6"
date: 2024-05-29
description: >-
     MocaccinoOS v1.6 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.6

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.  
With kind regards,  

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost  

Changes since 1.5.1:

- Cosmic Epoch git version (available in repository)
- Kernel is upgraded to 6.6.32 (LTS)
- Mesa version 24.0.7
- Nvidia-drivers version 550.78 (available in repository) 

Issues and improvements:

- Better support for Intel ARC GPU cards. ( https://github.com/mocaccinoOS/desktop/commit/7e519b07a7af17d0d3550a1e4c546f2b2856a601 )
- Theming is improved on the XFCE spin. ( https://github.com/mocaccinoOS/mocaccino/commit/2ecc375fc95bf6352c30d9fb924ac5fd95f94ed3 )
- We are aware that MOS images are not fully EFI complaint, certain (mostly older) systems are not booting properly with EFISTUB used in our images. At the moment we do not have a proper solution and the workaround is to change your BIOS settings to boot in legacy mode. ( https://github.com/mocaccinoOS/mocaccino/issues/130 )

Notes for testers:

Additional software can be installed through flatpak, docker or the community repository.
Please give us feedback by reporting bugs or sharing your ideas with us.
Check out our [documentation](https://www.mocaccino.org/docs/) pages

Support our work!

https://www.mocaccino.org/docs/donate/

Acknowledgement:
The project heavily depends on the work done by upstream [Gentoo Linux](https://gentoo.org) and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by Kairos.

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.
