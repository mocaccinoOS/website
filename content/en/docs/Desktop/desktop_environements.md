---
title: "Desktop environements"
linkTitle: "Desktop environements"
weight: 4
date: 2024-02-04
description: >
  Frequent commands
---

MocaccinoOS supports several popular desktop environments.
This page explains how to install them.

## KDE Plasma

This command installs the KDE Plasma desktop environment.

```bash

$ sudo luet install layers/plasma layers/kde-apps-minimal

```

If you prefer to use SDDM after installing plasma as your login manager run this command:

```bash

$ sudo systemctl enable sddm --force

```

