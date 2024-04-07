---
title: "Gaming"
linkTitle: "Gaming"
weight: 22
description: >-
     Essentials you need to know.
---

### Steam

We recommend installing Steam directly from the desktop repository. You can also use the [flatpak](/docs/desktop/flatpak) version but that could give problems because it is basically running in a sandbox.
To install Steam from the desktop repository you can issue the following installation command:

```bash

$ sudo luet install apps/steam

```

##### Gamemode

Gamemode allows you to temporarily apply some optimizations when you launch a game. This functionality is bundled in the apps/steam package. So if you install Steam you also have Gamemode installed.
To make Steam start a game with gamemode, right click the game in the Library, select Properties..., then in the Launch Options text box enter:

```bash

gamemoderun %command%

```

##### Additional Steam library NTFS

If you share a partition between Windows and MocaccinoOS that has a Steam library, please keep in mind that this can cause issues when trying to launch the game.
Due to the nature of NTFS, creating files/folders with names that are invalid on Windows will cause disk errors (leading to games that don't launch). The most common issue is a : (colon) character in filenames that Proton creates on the NTFS disk.

Fixing this is pretty simple: create the /compatdata folder on the mounted NTFS disk as a symlink that points to a folder on a Linux partition.

Creating the symlink:

```bash

$ mkdir -p ~/.steam/steam/steamapps/compatdata
$ ln -s ~/.steam/steam/steamapps/compatdata /media/gamedisk/Steam/steamapps/

```
*If the /compatdata folder already exists on the mounted disk BEFORE the symlink, DELETE IT!*

### Heroic Games Launcher

Installing and playing games using the Epic games store or GOG we recommend using Heroic Games Launcher. You can install this using [flatpak](/docs/desktop/flatpak).

### Lutris

An alternative platform for gamers is Lutris. 

```bash

$ sudo luet install apps/lutris

```
### Nvidia drivers

MocaccinoOS does not come with Nvidia-drivers pre-installed.
If you require these proprietary drivers you can issue this command:

```bash

$ sudo luet install kernel-modules/nvidia-drivers-lts

```
For older cards we also offer the 470 series:

```bash

$ sudo luet install kernel-modules/nvidia-drivers-470-lts

```

### Mangohud

Mangohud is available in the [Community repository](https://github.com/mocaccinoOS/community-repository?tab=readme-ov-file#-community-repository). If you have enabled this repository you can install it by using this command:

```bash

$ sudo luet install apps/mangohud

```
### Proton GE

[Proton GE](https://github.com/GloriousEggroll/proton-ge-custom?tab=readme-ov-file#proton-ge-custom) is a fork of Valve's Proton. 
This custom Proton version has several patches and bleeding edge technology that could help increase performance.

*GE stands for "GloriousEggroll" and is the nickname of Thomas Crider who works for RedHat.*


```bash

$ sudo luet install apps/proton-ge-custom-bin

```

After installation you should restart Steam. Afterwards you will have Proton GE available in the compatibility settings.

## References

- https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows#preventing-ntfs-read-errors
- https://wiki.archlinux.org/title/Gamemode#Run_Steam_with_gamemode
