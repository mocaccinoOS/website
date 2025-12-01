---
title: "Desktop environments"
linkTitle: "Desktop environments"
weight: 4
date: 2024-02-04
description: >
  MocaccinoOS supports several popular desktop environments.
---

This page explains how to install several desktop environments.

## KDE Plasma

This command installs the KDE Plasma desktop environment.

```bash
$ sudo luet install layers/plasma layers/kde-apps-minimal apps/discover
```
The layers/plasma package ships with the SDDM login manager.
If you prefer to use SDDM as your login manager run this command:

```bash
$ sudo systemctl enable sddm --force
```

## GNOME

This command installs the GNOME desktop environment.

```bash
$ sudo luet install layers/gnome apps/gnome-software
```
The layers/gnome package ships with the GDM login manager.
If you prefer to use GDM as your login manager run this command:

```bash
$ sudo systemctl enable gdm --force
```

## MATE

This command installs the MATE desktop environment.

```bash
$ sudo luet install layers/mate themes/mate 
```

## XFCE

This command installs the XFCE desktop environment.

```bash
$ sudo luet install layers/xfce 
```
## LXQT

This command installs the LXQT desktop environment.

```bash
$ sudo luet install layers/lxqt 
```

## Cinnamon

This command installs the Cinnamon desktop environment.

```bash
$ sudo luet install layers/cinnamon 
```

## Enlightenment

This command installs the Enlightenment desktop environment.

```bash
$ sudo luet install layers/enlightenment 
```

## Trinity

This command installs the Trinity desktop environment.

```bash
$ sudo luet install layers/trinity 
```
## Hyprland

This command installs the Hyprland desktop environment.

```bash
$ sudo luet install layers/hyprland layers/wlroots apps/kitty
```

## Fluxbox

This command installs the Fluxbox desktop environment.

```bash
$ sudo luet install layers/fluxbox 
```

## COSMIC

This command installs the COSMIC desktop environment.

```bash
$ sudo luet install layers/cosmic apps/cosmic-store 
```

## Login managers

If you prefer to use Lightdm as your login manager run these commands:

```bash
$ sudo luet install apps/lightdm
```

```bash
$ sudo systemctl enable lightdm --force
```

If you prefer to use Slim as your login manager run these commands:

```bash
$ sudo luet install apps/slim
```
```bash
$ sudo systemctl enable slim --force
```