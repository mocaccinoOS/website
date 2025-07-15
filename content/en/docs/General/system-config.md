---
title: "System Configuration"
linkTitle: "System Configuration"
weight: 4 
description: >-
     Dealing with system configuration after upgrades
---

MocaccinoOS Desktop and Micro automatically protects `/etc` from overwriting user-override changes. Although, upgrades might require to overwrite and upgrade specific default configuration. The `mos` cli embeds a `config-update` tool which is compatible with `etc-update` and `dispatch-conf`.

To show a summary of the config changes that requires merging: 

```shell
$ mos config-update check
Files with unmerged config files: 1
- /etc/test/foo (2 unmerged config files)
```

## Merging configuration

To merge configurations interactively, run:

```bash
$ mos config-update update
```

To check the configuration of all the files, 1-by-1, run:

```bash
$ mos config-update update -a
```

## Auto-merging

It's possible to auto-merge configurations automatically with:

```bash
$ mos config-update update --interactive=false
```