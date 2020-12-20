---
title: "Init system"
linkTitle: "Init system"
weight: 2
description: >-
     Service management on Mocaccino Micro
---


## Init system

The `Micro` and `MicroServer` ISO flavors are using `runit` as `init` system. For ease of use, a __very simple__ helper is provided, and can be used as follows:

### List available services

```bash
$ runit-list
```

### Start a service

```bash
$ runit-start sshd
```

### Stop a service

```bash
$ runit-stop sshd
```

### Enable a service on boot

```bash
$ runit-enable sshd
```

### Disable a service from booting on startup

```bash
$ runit-disable sshd
```

### Boot scripts

It's possible to add scripts to be executed during boot execution, under `/etc/runit/core-services/*.sh`.

For example:

```bash
$ echo "modprobe e1000e" > /etc/runit/core-services/modules.sh
```
