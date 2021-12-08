---
title: "Migrating from Sabayon"
linkTitle: "Migrating from Sabayon"
weight: 1
description: >-
     Migrating from Sabayon to MocaccinoOS Desktop
---

{{< alert color="warning" title="Warning" >}}
Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.
{{< /alert >}}

### Prepare your system
If you are on a GNOME/MATE/XFCE system you probably do not need Qt related packages. The more you remove prior to migration, the more easy it will go.
So for example if we do not need Qt we can uninstall qtcore using Entropy: 
```bash
equo remove dev-qt/qtcore --ask
```
{{< alert color="warning" title="Warning" >}}
Migration can take some time. We advice you to disable screen-locking and power savings. If your screen gets locked during upgrade you might not be able to login again while the upgrade is running.
{{< /alert >}}

You can convert a Sabayon system (running Entropy) to Mocaccino OS (running luet) with the following commands as root

```bash
curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
luet install system/luet-migrate-entropy
luet migrate-entropy
```
The migrate-entropy script detects packages that are installed and fills the luet database. If you for some reason need to repeat this step, please remove the luet database first. `rm /var/luet/db/luet.db`

Migrations have been checked for systems running Sabayon 18.05 and newer. You can check which version of Sabayon you are running with `cat /etc/sabayon-release`.

### Enable the Mocaccino Repositories

Once converted to Mocaccino OS, you will want to enable the Mocaccino Repositories

```bash
luet install repository/mocaccino-os-commons
luet install repository/mocaccino-extra-stable
luet install repository/mocaccino-desktop-stable
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
