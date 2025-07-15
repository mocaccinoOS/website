---
title: "Waydroid"
linkTitle: "Waydroid"
weight: 23
description: >-
     Installing and configuring waydroid in Mocaccino Desktop
---

## Installing and configuring

Waydroid is available in the [Community repository](https://github.com/mocaccinoOS/community-repository?tab=readme-ov-file#-community-repository). If you have enabled this repository you can install it by using this command:

```bash
$ sudo luet install apps/waydroid-vanilla
```
OR

```bash
$ sudo luet install apps/waydroid-gapps
```

We need to pass some arguements to the GRUB bootloader.
Edit /etc/default/grub and find GRUB_CMDLINE_LINUX and add:

```bash
binder.devices=binder,hwbinder,vndbinder
```

After editing this file, regenerate the grub config file:

```bash
grub-mkconfig -o /boot/grub/crug.cfg
```
Now restart the system.

Enable and start the waydroid systemd service
```bash
$ sudo systemctl enable --now waydroid-container.service
```
initialize for vanilla: 
```bash
$ sudo waydroid init
```
or for android with Gapps do:
```bash
$ sudo waydroid init -s GAPPS
```

### AppArmor (optional)

Waydroid can use AppArmor to sandbox Android processes, but it is not a hard requirement.
Since it is installed as a dependency of lxc, you might as well enable it.

Enable the apparmor service:

```bash
systemctl enable --now apparmor.service
```

Enable required boot parameters. Edit /etc/default/grub and append apparmor=1 security=apparmor parameters.

```bash
GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"
```
After editing this file, regenerate the grub config file:

```bash
grub-mkconfig -o /boot/grub/crug.cfg
```
Now restart the system.

## References

- https://wiki.gentoo.org/wiki/Waydroid
