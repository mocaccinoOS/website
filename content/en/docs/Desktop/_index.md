---
title: "Mocaccino Desktop"
linkTitle: "Mocaccino Desktop"
weight: 20
description: >-
     MocaccinoOS variant based from Portage
---

[Mocaccino Desktop](https://github.com/mocaccinoOS/desktop) is a Gentoo-based distribution (derived from Sabayon) oriented towards Desktop systems.

It contains installable "apps" that we refer internally as "layers" to install common suite of packages needed to bootstrap a pure and simple OS.

A User, should be able then to install KDE by calling `luet install layers/KDE` and nothing else. That package should bring all the necessary components to make the "app" work as expected. The user shouldn't be exposed to the typical OS architecture of bringing with it dozens of dependencies. 

Think at it like Android apps: Install and uninstall should be as simple as that.

This approach is completely different from [Mocaccino Micro](https://github.com/mocaccinoOS/mocaccino-micro), which is a LFS and all packages are compiled 1:1. 

In this repository, updates are OTA-alike, with less friction as possible.

## Why MOS Desktop is different?

For the user, MOS Desktop is a pure and simple OS. We target to deliver an unique approach on package installation and upgrades. Applications should bundle all the required dependencies in order to run, or alternatively share common layers that are used between them (for example think about MATE, GNOME, and all software that depends on GTK). This allows users to have OTA-alike updates, without having to struggle with all packages dependencies.

From a developer standpoint, MOS takes a unique approach on package building, allowing developers to iterate locally changes to the packages very easily, thanks to the Luet flexible backend approach. You can use Docker to build packages locally, or Kubernetes to build them in your cluster

## Download

[At the moment are available alpha ISO releases](https://get.mocaccino.org/minio/mocaccino-iso).

## Development Documentation

- [Ops guide](https://github.com/mocaccinoOS/desktop/blob/master/docs/ops_guide_to_galaxy.md)
- [Luet docs](https://luet-lab.github.io/docs/)

## Migrating from Sabayon systems

{{< alert color="warning" title="Warning" >}}
Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.
{{< /alert >}}

You can convert a Sabayon system (running Entropy) to Mocaccino OS (running luet) with the following commands as root

```bash
curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
luet install system/luet-migrate-entropy
luet migrate-entropy
```

Migrations have been checked for systems running Sabayon 18.05 and newer. You can check which version of Sabayon you are running with `cat /etc/sabayon-release`.

### Enabling the Portage Tree layer

Once converted to Mocaccino OS, you will want to enable the Mocaccino Repositories

```bash
luet install repository/mocaccino-os-commons
luet install repository/mocaccino-desktop-stable
luet install repository/mocaccino-extra-stable
```

### Upgrading to the latest packages

Install all available newer packages from the Mocaccino repositories using:

```bash
luet upgrade
```

And finally, review and merge any changes to your configuration files:

```bash
etc-update
```

### Remove cached downloads

If you wish to reclaim the disk space used by the upgrade process (downloaded packages and cached metadata), you can do so using:

```bash
luet cleanup
```
