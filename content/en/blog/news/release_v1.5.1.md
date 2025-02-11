---
title: "MocaccinoOS v1.5.1"
linkTitle: "MocaccinoOS v1.5.1"
date: 2024-30-03
description: >-
     MocaccinoOS v1.5.1 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.5.1

Due to an unfortunate [security issue](https://www.openwall.com/lists/oss-security/2024/03/29/4) that got exposed just yesterday (within 24 hours of our 1.5 release) we decided to withdraw that release and instantly prepare a revision that is not affected in any way by this. 

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.
With kind regards,

Ettore Di Giacinto
Joost Ruis
Mihai Dobrescu
Jerrod Frost

Changes since 1.4:

- Kernel is upgraded to 6.6.22 (LTS)
- PLASMA is upgraded to version 5.27.11
- GRUB is upgraded to version 2.12

Issues and improvements:

- Implemented "merge-usr" ( see https://wiki.gentoo.org/wiki/Merge-usr )
- Theming is improved on the MATE spin.
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
