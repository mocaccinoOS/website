---
title: "MocaccinoOS v26.04"
linkTitle: "MocaccinoOS v26.04"
date: 2026-03-31
description: >-
     MocaccinoOS v26.04 release
---

Hello everybody!

We’re excited to announce the release of MocaccinoOS v26.04.

We hope you enjoy this release and the improvements it brings.

With kind regards,

Ettore Di Giacinto  
Joost Ruis  
Mihai Dobrescu  
Jerrod Frost

### Changes since 26.03

- Kernel upgraded to 6.18.20 (LTS)
- Mesa version 26.0.3

### Issues and improvements

- Added a safe graphics boot option to live images and GRUB.
This uses nomodeset and can help systems with problematic NVIDIA GPUs boot successfully. It’s recommended to use this option until proprietary drivers are installed. ( https://github.com/mocaccinoOS/mocaccino/issues/191 )
- Updated the default wallpaper.  
     - An additional wallpaper pack is now available in the repositories (themes/mocaccino-wallpapers-extra).
- Fixed the default wallpaper configuration in XFCE.
- Continued development of Vajo (GUI/TUI frontend for Luet):
     - Added support for rolling back to previous snapshots
     - Introduced snapshot pinning (stay on a selected snapshot)
  

![MocaccinoOS_gold_circuit](https://github.com/user-attachments/assets/0abced6b-b6aa-467e-8da5-940c8746f40a)


### Help Us Improve MocaccinoOS

You can extend your system with additional software using Flatpak, Docker, or the community repository.
We welcome your feedback — whether it's bug reports or ideas for improvement.

Explore our [documentation](https://www.mocaccino.org/docs/) to learn more.

### Project sustainability note
MocaccinoOS is currently supported by community donations totaling **approximately $9 per month**.
While development continues, this level of funding is not sufficient to sustainably support long-term work.

If you find MocaccinoOS useful and would like to help keep the project healthy, consider supporting us via donations.

https://www.mocaccino.org/docs/donate/

### Acknowledgement
MocaccinoOS builds on the incredible work of the Gentoo Linux community. We are grateful for their efforts, and all packages are compiled on our own infrastructure powered by Kairos

### Download

#### Torrents

[MocaccinoOS-KDE-0.20260331.iso]( magnet:?xt=urn:btih:cedf80b17f3cd333b669fa4af2a4379db869455f&xt=urn:btmh:122007a738b37fa98aaf4eaca6ede8a429da44334d496976c34b67d78732ccae61a0&dn=MocaccinoOS-KDE-0.20260331.iso&xl=2147483648&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce&tr=http%3A%2F%2Ftracker.linuxtracker.org%3A2710%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce ) ( sha256: 2837b19b20d89c278bc37a78eb6b3aac07d407d01e2e781d9e539bb6f957de02 )

[MocaccinoOS-GNOME-0.20260331.iso]( magnet:?xt=urn:btih:1661b910ec93fb897d5271eafb21e743da433d06&xt=urn:btmh:1220e95cf104e60dc5a256b086f8827352b95e6821468a449d922132b0171b60cb61&dn=MocaccinoOS-GNOME-0.20260331.iso&xl=2147483648&tr=http%3A%2F%2Ftracker.linuxtracker.org%3A2710%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce ) ( sha256: b6be594641d92739babedc5eda9ed694f0e388c2f71c1e0ba5bf3d9bfa591c13 )

[MocaccinoOS-XFCE-0.20260331.iso]( magnet:?xt=urn:btih:357b8d0c0fe4b268882b6f258e395baf9ddac291&xt=urn:btmh:1220a4c3480e9c88e4c0d14d69108da460d1f2c747d04591e688b8e777467f1c3e2e&dn=MocaccinoOS-XFCE-0.20260331.iso&xl=2018148352&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce&tr=http%3A%2F%2Ftracker.linuxtracker.org%3A2710%2Fannounce&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce ) ( sha256: 791b3749915359c2b110706d24acce1cc650c91f547240b4954bb6e7b76ae033 )

[MocaccinoOS-MATE-0.20260331.iso]( magnet:?xt=urn:btih:550029bf052af0fca895b377518bd3e364f69c5e&xt=urn:btmh:12209a0de8d1c8db6fff8f2f06ca27865c0be60dc5d5b77e274919ba0e06be63d0b6&dn=MocaccinoOS-MATE-0.20260331.iso&xl=2126544896&tr=udp%3A%2F%2Ftracker.torrent.eu.org%3A451%2Fannounce&tr=http%3A%2F%2Ftracker.linuxtracker.org%3A2710%2Fannounce&tr=udp%3A%2F%2Ftracker.opentrackr.org%3A1337%2Fannounce&tr=udp%3A%2F%2Fopen.demonii.com%3A1337%2Fannounce&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A6969%2Fannounce&tr=udp%3A%2F%2Fexodus.desync.com%3A6969%2Fannounce ) ( sha256: a87f0b6f5d8bea63015b3b740abbcfa3587d9c3780c483fbe95052ca339d5b78 )

#### Direct download

Check out our [download page](https://github.com/mocaccinoOS/mocaccino/releases) for all recent releases.