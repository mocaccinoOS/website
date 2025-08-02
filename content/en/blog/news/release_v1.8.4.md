---
title: "MocaccinoOS v1.8.4"
linkTitle: "MocaccinoOS v1.8.4"
date: 2025-08-02
description: >-
     MocaccinoOS v1.8.4 release
---

Hello everybody!

Today we are releasing MocaccinoOS v1.8.4

This is mostly an upgraded version that doesn't introduce too many new features. Everything is compiled against a very recent Gentoo Portage tree.

The team hopes you enjoy our effort.  
With kind regards,  

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost  

### Changes since 1.8.3:

- Kernel is upgraded to 6.12.41 (LTS)
- Mesa version 25.1.6
- Nvidia-drivers version 570.169 (available in repository)
- KDE Plasma 6.3.6

### Issues and improvements:

#### Calamares Language Fix
The Calamares installer now correctly applies your selected system language. Previously, installed systems could default to English regardless of user choice. https://github.com/mocaccinoOS/os-commons/commit/1661b47a78e33b5de5c8b498a35b49f771dfa7ae

#### Performance Improvements
All binaries have been rebuilt using more aggressive compiler flags. These optimizations result in better performance and smaller binaries. https://github.com/mocaccinoOS/desktop/commit/8ababf7fd8a2dde6b5f601500c1b8bcd5d7af122

#### Improved Flatpak Sandboxing Compatibility
 Enhanced sandboxing support resolves issues with Flatpak apps like Nextcloud from Flathub. https://github.com/mocaccinoOS/mocaccino/issues/160

#### HDD Compatibility Enhancements
A new udev rule is now pre-installed to improve detection and compatibility with older mechanical hard drives. https://github.com/mocaccinoOS/mocaccino/commit/d21ea6abcf4a0acb917f2003aae81483767a29ff

#### Intel ARC Battlemage Support
Detection code for Intel ARC GPUs has been updated to correctly identify Battlemage-series cards. https://github.com/mocaccinoOS/desktop/commit/14a716acd703593c180124c023e9681dde092265

_We are aware that MOS images are not fully EFI complaint, certain (mostly older) systems are not booting properly with EFISTUB used in our images. At the moment we do not have a proper solution and the workaround is to change your BIOS settings to boot in legacy mode. ( https://github.com/mocaccinoOS/mocaccino/issues/130 )_

### Help Us Improve MocaccinoOS:

You can extend your system with additional software using Flatpak, Docker, or the community repository.
We welcome your feedback — whether it's bug reports or ideas for improvement.

Explore our [documentation](https://www.mocaccino.org/docs/) to learn more.

### Support our work!

https://www.mocaccino.org/docs/donate/

### Acknowledgement:
The project heavily depends on the work done by upstream Gentoo Linux and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by Kairos.

### Download

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.
