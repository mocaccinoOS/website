---
title: "Migrating from Gentoo"
linkTitle: "Migrating from Gentoo"
weight: 1
description: >-
     Migrating from Gentoo to MocaccinoOS Desktop
---

{{< alert color="warning" title="Warning" >}}
Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.

This section is completely experimental, if you want to help us to improve it, please edit or submit an issue
{{< /alert >}}

You can convert a Gentoo system to Mocaccino OS (running luet) with the following commands as root

```bash
$ sudo curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
$ sudo luet install system/luet-migrate-emerge
$ sudo luet migrate-emerge
```
migrate-emerge detects packages that are installed and fills the luet database accordingly. It will report any errors if any to screen. If you for some reason need to repeat this step, please remove the luet database first. `rm /var/luet/db/luet.db`

Even if in this way it is possible to keep in syncronization the db from portage to luet, migrations are experimental and are not guaranteed to work. Mixed systems aren't supported, and usage of `emerge` and `luet` in the system is discouraged, see  [how to build packages](/docs/desktop/building_packages) instead.

### Enabling the Portage Tree layer

Once converted to Mocaccino OS, you will want to enable the Mocaccino Repositories

```bash
$ sudo luet install repository/mocaccino-os-commons
$ sudo luet install repository/mocaccino-extra-stable
$ sudo luet install repository/mocaccino-desktop-stable
```

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
