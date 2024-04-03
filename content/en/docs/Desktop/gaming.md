---
title: "Gaming"
linkTitle: "Gaming"
weight: 22
description: >-
     Essentials you need to know.
---

### Steam

We recommend installing Steam directly from the desktop repository. You can also use the flatpak version but that could give problems because it is basically running in a sandbox.
To install Steam from the desktop repository you can issue the following installation command:

```bash

$ sudo luet install apps/steam

```

## Gamemode

Gamemode allows you to temporarily apply some optimizations when you launch a game. This functionality is bundled in the apps/steam package. So if you install Steam you also have Gamemode installed.
To make Steam start a game with gamemode, right click the game in the Library, select Properties..., then in the Launch Options text box enter:

```bash

gamemoderun %command%

```

### Heroic Games Launcher

Installing and playing games using the Epic games store or GOC we recommend using Heroic Games Launcher. You can install this using flatpak.

### Nvidia drivers

MocaccinoOS does not come with Nvidia-drivers pre-installed.
If you require these proprietary drivers you can issue this command:

```bash

$ sudo luet install kernel-modules/nvidia-drivers-lts

``
For older cards we alos offer the 470 series:

```bash

$ sudo luet install kernel-modules/nvidia-drivers-470-lts

``
