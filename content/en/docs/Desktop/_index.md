---
title: "Mocaccino Desktop"
linkTitle: "Mocaccino Desktop"
weight: 3
description: >-
     MocaccinoOS variant based from Portage
---

[Mocaccino Desktop](https://github.com/mocaccinoOS/desktop) is a Gentoo-based distribution (derived from Sabayon) oriented towards Desktop systems.

It contains installable "apps" that we refer internally as "layers" to install common suite of packages needed to bootstrap a pure and simple OS.

A user should be able then to install KDE Plasma by running `luet install layers/plasma` and nothing else. That package should install all the necessary components to make the "app" work as expected. The user shouldn't be exposed to the typical OS architecture of bringing with it dozens of dependencies. Simply said: All micropackages are abstracted away and are included in a layer and installed as a single package.

Think at it like Android apps: Install and uninstall should be as simple as that.

This approach is completely different from [Mocaccino Micro](https://github.com/mocaccinoOS/mocaccino-micro), which is a LFS and all packages are compiled 1:1. 

In this repository, updates are OTA-alike, with less friction as possible.

## Why MOS Desktop is different?

For the user, MOS Desktop is a pure and simple OS. We target to deliver an unique approach on package installation and upgrades. Applications should bundle all the required dependencies in order to run, or alternatively share common layers that are used between them (for example think about MATE, GNOME, and all software that depends on GTK). This allows users to have OTA-alike updates, without having to struggle with all packages dependencies.

From a developer standpoint, MOS takes a unique approach on package building, allowing developers to iterate locally changes to the packages very easily, thanks to the Luet flexible backend approach. You can use Docker to build packages locally, or Kubernetes to build them in your cluster
