---
title: "Mocaccino Portage"
linkTitle: "Mocaccino Portage"
weight: 20
---

[Mocaccino Portage](https://github.com/mocaccinoOS/portage-tree) is a Gentoo-based distribution (derived from Sabayon) oriented towards Desktop systems.

[At the moment are available alpha ISO releases](https://get.mocaccino.org/minio/mocaccino-iso).

## Migrating from Entropy systems

You can convert a Sabayon system running Entropy to Mocaccino OS running luet with the following commands as root

```bash
curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
luet migrate-entropy
```

## Enabling the Portage Tree layer

Once converted to Mocaccino OS, you will want to enable the Mocaccino Repositories

```bash
luet install repository/mocaccino-portage-stable
luet install repository/mocaccino-extra
```

For the moment, it is also necessary to install the config file protection package to prevent your config files being replaced during an upgrade. In future, these will be installed automatically.

```bash
luet install system/default-protect 
```

## Upgrading to the latest packages

```bash
luet upgrade
```
