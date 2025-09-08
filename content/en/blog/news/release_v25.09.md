---
title: "MocaccinoOS v25.09"
linkTitle: "MocaccinoOS v25.09"
date: 2025-09-08
description: >-
     MocaccinoOS v25.09 release
---

Hello everybody!

We’re excited to announce the release of MocaccinoOS v25.09.
With this milestone, we’ve updated our versioning scheme to better reflect our rolling-release nature.

From now on, MocaccinoOS will follow the year.month format (YY.MM).
This makes it clearer when a snapshot was published, while keeping the system continuously up to date.

Enjoy the latest improvements and optimizations in v25.09 — fast, minimal, and gaming-ready as always.

The team hopes you enjoy our effort.
With kind regards,

Ettore Di Giacinto
Joost Ruis
Mihai Dobrescu
Jerrod Frost

### Changes since 1.8.4:

- Kernel is upgraded to 6.12.45 (LTS)
- Mesa version 25.1.9
- Nvidia-drivers version 570.181 (available in repository)

### Issues and improvements:

MocaccinoOS v25.09 builds upon the entire 1.8.x series, encapsulating significant refinements without reintroducing old issues. Highlights include:

- #### Performance enhancements: Across releases, binaries have been rebuilt with more aggressive compiler flags for better speed and leaner size.

- #### Improved hardware and compatibility support:

  - Intel Xe and ARC Battlemage detection code integrated.
  - Additional udev rules for older HDD detection.

- ####  Flatpak sandboxing fixes (notably for apps like Nextcloud).

- ####  Installer updates: Calamares now correctly applies user-selected system languages during installation.

- ####  EFI status reminder: Some older UEFI systems may require BIOS legacy mode due to EFISTUB limitations (still unresolved).

These enhancements are now unified in v25.09, adopting our new year.month versioning aligned with our rolling-release cycle.

### Help Us Improve MocaccinoOS:

You can extend your system with additional software using Flatpak, Docker, or the community repository.
We welcome your feedback — whether it's bug reports or ideas for improvement.

Explore our [documentation](https://www.mocaccino.org/docs/) to learn more.

### Support our work!

https://www.mocaccino.org/docs/donate/

### Acknowledgement:
The project heavily depends on the work done by upstream Gentoo Linux and we would like to thank them for their hard and excellent work! MocaccinoOS compiles all software available in the repositories using their own infrastructure that is powered by Kairos.

MOS comes in several flavors, pick whatever suits you best.
_(Please note that DesktopMinimal image is used for testing purposes and does not feature an installer!)_