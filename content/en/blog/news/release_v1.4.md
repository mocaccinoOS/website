---
title: "MocaccinoOS v1.4"
linkTitle: "MocaccinoOS v1.4"
date: 2024-01-24
description: >-
     MocaccinoOS v1.4 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.4
This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.
With kind regards,

Ettore Di Giacinto
Joost Ruis
Mihai Dobrescu
Jerrod Frost

Changes since 1.3:

- Kernel is upgraded to 6.1.72 (LTS)
- GNOME is upgraded to version 45.2
- PLASMA is upgraded to version 5.27.10
- Integrated Gentoo binaries in our build process. ( This certainly lowered our products CO₂ footprint! )

Issues and improvements:

- Better support for the XFS filesystem ( https://github.com/mocaccinoOS/desktop/commit/d33d5412cec16ddb185ea4d3fc92a4eca020cafb )
- Better support for Wifi/Bluetooth for MT7921E ( https://github.com/mocaccinoOS/desktop/commit/db323a2ba9b54b7ef1d6f7faba352aabbec626d3 )
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
