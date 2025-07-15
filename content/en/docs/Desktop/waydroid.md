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
or

```bash
$ sudo luet install apps/waydroid-gapps
```

We need to pass some arguments to the GRUB bootloader.
Edit /etc/default/grub with your preferred text editor (e.g., sudo nano /etc/default/grub) and find GRUB_CMDLINE_LINUX and add:

```bash
binder.devices=binder,hwbinder,vndbinder
```

After editing this file, regenerate the grub config file:

```bash
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```
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
To apply GRUB changes and bring up binderfs we have to restart the system.

### AppArmor (optional)

Waydroid will run without AppArmor, but enabling it adds an extra layer of sandboxing for Android processes.
Since it is installed as a dependency of lxc, you might as well enable it.

Enable the apparmor service:

```bash
systemctl enable --now apparmor.service
```

Enable required boot parameters. Edit /etc/default/grub with your preferred text editor (e.g., sudo nano /etc/default/grub) and find GRUB_CMDLINE_LINUX and append apparmor=1 security=apparmor parameters.

```bash
GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"
```
After editing this file, regenerate the grub config file:

```bash
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```
Now restart the system.

## References

- https://wiki.gentoo.org/wiki/Waydroid
