---
title: "Mocaccino Portage"
linkTitle: "Mocaccino Portage"
weight: 20
---

[Mocaccino Portage](https://github.com/mocaccinoOS/portage-tree) is a Gentoo-based distribution (derived from Sabayon) oriented towards Desktop systems.

[At the moment are available alpha ISO releases](https://get.mocaccino.org/minio/mocaccino-iso).


## Migrating from Sabayon systems

{{< alert color="warning" title="Warning" >}}
Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.
{{< /alert >}}

You can convert a Sabayon system (running Entropy) to Mocaccino OS (running luet) with the following commands as root

```bash
curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
luet migrate-entropy
```

Migrations have been checked for systems running Sabayon 18.05 and newer. You can check which version of Sabayon you are running with `cat /etc/sabayon-release`.

## Enabling the Portage Tree layer

Once converted to Mocaccino OS, you will want to enable the Mocaccino Repositories

```bash
luet install repository/mocaccino-portage-stable
luet install repository/mocaccino-extra
```

## Upgrading to the latest packages

Install all available newer packages from the Mocaccino repositories using:

```bash
luet upgrade
```

And finally, review and merge any changes to your configuration files:

```bash
etc-update
```

## Remove cached downloads

If you wish to reclaim the disk space used by the upgrade process (downloaded packages and cached metadata), you can do so using:

```bash
luet cleanup
```
