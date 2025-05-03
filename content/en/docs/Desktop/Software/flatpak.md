---
title: "Flatpak"
linkTitle: "Flatpak"
weight: 1
description: >-
     MocaccinoOS and Flatpak integration
---

MocaccinoOS Desktop supports flatpak, and its usage is encouraged for packages like Spotify, Telegram, and others not found in the default desktop repository or community repository.

To install flatpak, run as root:

```bash
$> luet install apps/flatpak
```

Once flatpak is installed, from your user add the flathub repo:

```bash
user $> flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

To install Spotify, for example, now you can: 

```bash
user $> flatpak install Spotify
```

For a detailed documentation, we suggest as a follow-up reading the [official docs](https://docs.flatpak.org/en/latest/using-flatpak.html), here you can find a short summary of the most used commands.

## Search

Applications can be found in any of the added remotes using the search command. For example:

```bash
$ flatpak search gimp
```

## Running applications

After an application is installed, can be run by their id:

```bash
$> flatpak run org.gimp.GIMP
```

## Updating

To update all your installed applications and runtimes to the latest available version in Flatpak, run:

```bash
$> flatpak update
```

## Accessing external paths (or storage) from Flatpak apps

Flatpak runs applications in sandbox that prevents them to access the host content. 
You can although add paths that are accessible to a specific Flatpak app.

For example, to expose the path `/mnt` to our `org.app.Id`:

```bash
$>  flatpak override --user --filesystem=/mnt org.app.Id
```

[Flatseal](https://flathub.org/apps/details/com.github.tchx84.Flatseal) is a GUI permissions manager which offer simple point-and-click permissions operations. 

### References

- [Flatpak documentation](https://docs.flatpak.org/en/latest/using-flatpak.html)
- [Flathub](https://flathub.org/)
- [Give access to flatpak applications](https://davejansen.com/give-full-filesystem-access-to-flatpak-installed-applications/)
- [bauh - a visual frontend for Flatpak (and others)](https://github.com/vinifmor/bauh)
