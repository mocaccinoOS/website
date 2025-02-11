---
title: "MocaccinoOS v1.3"
linkTitle: "MocaccinoOS v1.3"
date: 2023-07-08
description: >-
     MocaccinoOS v1.3 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.3
This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree. 

The team hopes you enjoy our effort.
With kind regards,

Ettore Di Giacinto
Joost Ruis
Mihai Dobrescu
Jerrod Frost

Changes since 1.2:
Kernel is upgraded to 6.1.35 (LTS)
GNOME is upgraded to version 44.1

Issues and improvements:
Replace dhclient with dhcpcd ( https://github.com/mocaccinoOS/desktop/commit/af9c1cb61285ed304214f8c7a65ac97b3d12d3b8 )
Replace wpa_supplicant with iwd ( https://github.com/mocaccinoOS/desktop/commit/0b5bc775dc5144a160a734846d794ebf2ddc545b )
Improved support for [AV1](https://en.wikipedia.org/wiki/AV1) 
Make sure we set CHOST in env ( https://github.com/mocaccinoOS/desktop/commit/27a5d9c0833f1c2a5325922ae0e5469fc60a0dc5 )

Notes for testers:

Additional software can be installed through flatpak, docker or the [community repository](https://github.com/mocaccinoOS/community-repository).
    Please give us feedback by reporting bugs or sharing your ideas with us.
    Check out our [documentation pages](https://www.mocaccino.org/docs/)

Support our work!

https://www.mocaccino.org/docs/donate/

Acknowledgement:
The project heavily depends on the work done by upstream [Gentoo Linux](https://gentoo.org) and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by [Kairos](https://kairos.io/).

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.
