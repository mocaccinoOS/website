---
title: "Service Management and Init"
linkTitle: "Init and Services"
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

## Yip Integration

Mocaccino Micro can be configured to execute `yipfiles` during different stages. 

```bash
$ luet install runit-srv/yip
```

To start the `yip` service:

```bash
$ runit-start yip
```

To Enable yip on boot:
```bash
$ runit-enable yip
```

### Recurring yip files

The yip service runs periodically yip files in `/etc/yip.d` or in `/etc/yip.yaml` on the system. 

For example, by creating a yip file as `/etc/yip.d/sshd.yaml`:

```yaml
name: "sshd"
stages:
  reconcile:
       -  name: "sshd_config setup"
          commands: 
          - chmod 644 /etc/ssh/sshd_config
          files:
          - path: "/etc/ssh/sshd_config"
            owner: 0
            group: 0
            permission: 644
            content: |
                      AuthorizedKeysFile %h/.ssh/authorized_keys
                      PermitRootLogin yes
                      ListenAddress 0.0.0.0
```

`yip` will make sure and keep sshd configured.


There are two stages currently supported: `reconcile` and `boot`. The `boot` `yip` stage is run at start, during runit initialization, while the `reconcile` is called periodically.

For more information about yip, [check here](https://github.com/mudler/yip)

### Specifing yip files from boot

It is also possible to use `yip` to automatically configure the system from boot.

Add `yip=...` to the boot command lines to specify the `yip` file to execute across the stages (can be a path to a local file, or either a URL)

