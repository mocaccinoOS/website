---
title: "Mocaccino Portage"
linkTitle: "Mocaccino Portage"
weight: 20
---

[Mocaccino Portage](https://github.com/mocaccinoOS/portage-tree) is a Gentoo-based distribution (derived from Sabayon) oriented towards Desktop systems.

[At the moment are available alpha ISO releases](https://get.mocaccino.org/minio/mocaccino-iso).

## Migrating from Entropy systems

At the moment there aren't packages to migrate to, but it's possible to migrate the Entropy DB to Luet with the following:

```bash
$ curl https://get.mocaccino.org/luet/get_luet_root.sh | sudo sh
$ luet install system/luet-extensions
$ luet migrate-entropy
```