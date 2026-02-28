---
title: "Migrating from Sabayon"
linkTitle: "Migrating from Sabayon"
weight: 1
description: >-
     Migrating from Sabayon to MocaccinoOS Desktop
---

{{< alert color="warning" title="Warning" >}}
The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.
{{< /alert >}}

### Prepare your system
If you are on a GNOME/MATE/XFCE system you probably do not need Qt related packages. The more you remove prior to migration, the more easy it will go.
So for example if we do not need Qt we can uninstall qtcore using Entropy: 
```bash
$ sudo equo remove dev-qt/qtcore --ask
```
{{< alert color="warning" title="Warning" >}}
Migration can take some time. We advise you to disable screen-locking and power savings. If your screen gets locked during upgrade you might not be able to login again while the upgrade is running.
{{< /alert >}}

{{< alert color="warning" title="Warning" >}}
Because we need to basically download everything in addition to the current installation you need a significant amount of free disk space. We recommend at least 30GB of free space for a basic installation.
{{< /alert >}}

You can convert a Sabayon system (running Entropy) to Mocaccino OS (running luet) with the following commands as root

```bash
$ sudo curl -k https://get.mocaccino.org/luet/get_luet_root.sh | sh
$ sudo luet install repository/mocaccino-os-commons repository/mocaccino-extra repository/mocaccino-desktop-stable
$ sudo luet install system/luet-migrate-entropy
$ sudo luet migrate-entropy
```
The migrate-entropy script detects packages that are installed and fills the luet database. If you for some reason need to repeat this step, please remove the luet database first. `rm /var/luet/db/luet.db`

Migrations have been checked for systems running Sabayon 18.05 and newer. You can check which version of Sabayon you are running with `cat /etc/sabayon-release`.

### Upgrading to the latest packages

Install all available newer packages from the Mocaccino repositories using:

```bash
$ sudo luet upgrade
```

And finally, review and merge any changes to your configuration files:

```bash
$ sudo etc-update
```

### Remove cached downloads

If you wish to reclaim the disk space used by the upgrade process (downloaded packages and cached metadata), you can do so using:

```bash
$ sudo luet cleanup
```

## Manual migration

{{< alert color="primary" title="Note" >}}
Note, the steps below are a work in progress and might not work at all and break your system. Consider using the steps below to try to recovery from a broken migration.
{{< /alert >}}

It is possible to migrate manually a system by running `luet migrate-entropy` and replacing packages with the layers available in the `mOS` repositories, for instance, to migrate and replace all packages with the gnome variant:

```bash
$ sudo curl -k https://get.mocaccino.org/luet/get_luet_root.sh | sh
$ sudo luet install -y repository/mocaccino-os-commons repository/mocaccino-kernel-stable repository/mocaccino-extra repository/mocaccino-desktop-stable
$ sudo luet install -y system/luet-migrate-entropy utils/jq
$ sudo luet migrate-entropy
$ sudo mkdir -p /etc/mocaccino/
$ sudo echo "desktop" > /etc/mocaccino/release
$ sudo installed=$(luet search --installed -o json | jq '.packages | map(.category+"/"+.name+"@"+.version)[]' -rc | xargs echo)
luet replace $installed --for kernel/mocaccino-lts-full --for kernel/mocaccino-lts-modules --for layers/firmware --for system-profile/default-systemd --for system/luet --for layers/system-x --for layers/gnome
```

