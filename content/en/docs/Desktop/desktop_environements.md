---
title: "Desktop environements"
linkTitle: "Desktop environements"
weight: 4
date: 2024-02-04
description: >
  MocaccinoOS supports several popular desktop environments.
---

This page explains how to install several desktop environments.

## KDE Plasma

This command installs the KDE Plasma desktop environment.

```bash

$ sudo luet install layers/plasma layers/kde-apps-minimal

```
The layers/plasma package ships with the SDDM login manager.
If you prefer to use SDDM as your login manager run this command:

```bash

$ sudo systemctl enable sddm --force

```

## GNOME

This command installs the GNOME desktop environment.

```bash

$ sudo luet install layers/gnome

```
The layers/gnome package ships with the GDM login manager.
If you prefer to use GDM as your login manager run this command:

```bash

$ sudo systemctl enable gdm --force

```

## MATE

This command installs the MATE desktop environment.

```bash

$ sudo luet install layers/mate  

```

If you prefer to use Lightdm as your login manager run these commands:

```bash

$ sudo luet install apps/lightdm

```
```bash

$ sudo systemctl enable lightdm --force

```

## XFCE

This command installs the XFCE desktop environment.

```bash

$ sudo luet install layers/xfce 

```
## Cinnamon

This command installs the Cinnamon desktop environment.

```bash

$ sudo luet install layers/cinnamon 

```

## Enlightenment

This command installs the Cinnamon desktop environment.

```bash

$ sudo luet install layers/enlightenment 

```
