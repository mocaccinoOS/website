---
title: "Snap"
linkTitle: "Snap"
weight: 1.1
description: >-
     MocaccinoOS and Snap integration
---

Besides (prefered) flatpak, MocaccinoOS also offers snap.

{{< alert color="warning" title="Warning" >}}
Using Snap is currently experimental on MocaccinoOS
{{< /alert >}}

## Installing and configuring

To install snap, run as root:

```bash
luet install apps/snapd
```

Once the snap package is installed, enable these services:

```bash
systemctl enable --now snapd.socket
```

### AppArmor

Snap’s fallback behavior without AppArmor is flaky, and some snaps won’t work at all.
So we must enable AppArmor on our system. It is pulled in as a dependency of the apps/snapd package so we already have it on the system.

Enable the apparmor service:

```bash
systemctl enable --now apparmor.service snapd.apparmor.service
```

Enable required boot parameters. Edit /etc/default/grub and append apparmor=1 security=apparmor parameters.

```bash
GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"
```
After editing this file, regenerate the grub config file:

```bash
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```
Now restart the system.

## Using snap

To install Spotify, for example, now you can: 

```bash
sudo snap install spotify
```

For a detailed documentation, we suggest as a follow-up reading the [official docs](https://snapcraft.io/docs/get-started), here you can find a short summary of the most used commands.

## Search

Applications can be found in any of the added remotes using the search command. For example:

```bash
snap find spotify
```

## Running applications

After an application is installed, can be run by their id:

```bash
snap run spotify
```

## Updating

To update all your installed applications and runtimes to the latest available version in Flatpak, run:

```bash
snap refresh
```

### References

- [Gentoo Security Handbook](https://wiki.gentoo.org/wiki/Security_Handbook/Linux_Security_Modules/AppArmor)
- [Gentoo documentation](https://wiki.gentoo.org/wiki/Snap)
