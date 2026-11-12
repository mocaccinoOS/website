---
title: Gaming
weight: 50
description: >-
  Install and set up Steam, Proton GE, Heroic, Lutris, Nvidia drivers and MangoHud.
---

This page covers the main ways to play games on MocaccinoOS Desktop, from the Steam client to GOG and Epic games, and the tools that go with them.

## Quick reference

| Tool | Used for | Where it comes from | Install |
|---|---|---|---|
| Steam | Steam library, includes Gamemode and VKBasalt | Desktop repository | `sudo luet install apps/steam` |
| Proton GE | Custom Proton with extra patches | Community repository | `sudo luet install apps/proton-ge-custom-bin` |
| Heroic Games Launcher | Epic Games Store and GOG | Flatpak | `flatpak install flathub com.heroicgameslauncher.hgl` |
| Epic Games Launcher | Official Epic launcher for Linux (preview) | Luet | `sudo luet install apps/epic-games-launcher` |
| Lutris | Game platform for non-Steam games | Community repository | `sudo luet install apps/lutris` |
| Nvidia drivers | Proprietary Nvidia GPU drivers | Desktop repository | `sudo luet install kernel-modules/nvidia-drivers-lts` |
| MangoHud | FPS and hardware overlay | Community repository | `sudo luet install apps/mangohud` |

Proton GE, Lutris and MangoHud are in the [community repository](/docs/desktop/luet/repositories/#community-repository). Enable it first if you have not done so already.

## Steam

We recommend installing Steam directly from the desktop repository:

```
$ sudo luet install apps/steam
```

You can also use the [Flatpak](/docs/desktop/software/flatpak/) version, but it runs in a sandbox, which can cause problems with some games.

### Gamemode

Gamemode temporarily applies optimizations while a game is running. It is bundled in the `apps/steam` package, so it is installed together with Steam.

To start a game with Gamemode, right-click the game in your Library, select **Properties...** and enter this in the **Launch Options** box:

```
gamemoderun %command%
```

### VKBasalt

VKBasalt is a post-processing layer for Vulkan that lets you enhance graphics further. It only works with Vulkan, which includes all Proton games. It is bundled in the `apps/steam` package, so it is installed together with Steam.

To use VKBasalt for a Steam game, enter this as a launch option:

```
ENABLE_VKBASALT=1 %command%
```

For non-Steam games, start the game from a terminal like this:

```
$ ENABLE_VKBASALT=1 mygame
```

### Steam library on an NTFS partition

If you share a partition with Windows that holds a Steam library, games can fail to launch. Proton creates files and folders with names that are not valid on Windows, most commonly with a `:` (colon) in the name. NTFS cannot store these, which leads to disk errors.

The fix is to make the `compatdata` folder on the NTFS disk a symlink to a folder on a Linux partition.

First, if a `compatdata` folder already exists on the NTFS disk, remove it. The symlink cannot be created while it is there. It holds Proton prefixes (per-game Wine environments), so back up any game saves you need from it first.

Then create the folder on the Linux side and link to it from the NTFS disk (adjust the path to your mounted disk):

```
$ mkdir -p ~/.steam/steam/steamapps/compatdata
$ ln -s ~/.steam/steam/steamapps/compatdata /media/gamedisk/Steam/steamapps/
```

### Proton GE

[Proton GE](https://github.com/GloriousEggroll/proton-ge-custom?tab=readme-ov-file#proton-ge-custom) is a fork of Valve's Proton, made by GloriousEggroll (GE). This custom Proton version has several patches and bleeding-edge technology that can help increase performance.

Proton GE is in the [community repository](/docs/desktop/luet/repositories/#community-repository). With that repository enabled, install it with:

```
$ sudo luet install apps/proton-ge-custom-bin
```

Restart Steam afterwards. Proton GE then shows up in the compatibility settings.

## Heroic Games Launcher

For games from the Epic Games Store or GOG, we recommend Heroic Games Launcher. Install it using [Flatpak](/docs/desktop/software/flatpak/):

```
$ flatpak install flathub com.heroicgameslauncher.hgl
```

## Epic Games Launcher

The Epic Games Launcher for Linux is available on MocaccinoOS. It is currently in preview, so expect it to change. Install it with:

```
$ sudo luet install apps/epic-games-launcher
```

Heroic Games Launcher (above) remains an alternative for Epic Games Store and GOG games.

## Lutris

Lutris is an alternative game platform. It is in the [community repository](/docs/desktop/luet/repositories/#community-repository). With that repository enabled, install it with:

```
$ sudo luet install apps/lutris
```

## Nvidia drivers

MocaccinoOS does not come with the proprietary Nvidia drivers pre-installed. If you need them, run:

```
$ sudo luet install kernel-modules/nvidia-drivers-lts
```

## MangoHud

MangoHud is an overlay that shows FPS, temperatures, CPU/GPU load and more. It is in the [community repository](/docs/desktop/luet/repositories/#community-repository). With that repository enabled, install it with:

```
$ sudo luet install apps/mangohud
```

To show it in a Steam game, enter this as a launch option:

```
mangohud %command%
```

## Tuning your system for games

The [Performance](/docs/desktop/performance/) page covers settings that matter for gaming:

- a low-latency TCP profile for online games and voice chat
- a higher `vm.max_map_count`, which some games need (DayZ requires `1048576`)
- optional `sched_ext` schedulers, such as `scx_lavd`, which is aimed at gaming and interactive use

## References

- <https://github.com/ValveSoftware/Proton/wiki/Using-a-NTFS-disk-with-Linux-and-Windows#preventing-ntfs-read-errors>
- <https://wiki.archlinux.org/title/Gamemode#Run_Steam_with_gamemode>
- <https://steamcommunity.com/sharedfiles/filedetails/?id=1787799592>
