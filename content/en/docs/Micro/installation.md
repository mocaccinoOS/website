---
title: "Installation notes"
linkTitle: "Installation notes"
weight: 3
description: >-
     Installation and after install notes
---

## Installation 

At the moment `Micro` images are tested to be bootable with Virtualbox, and can be installed in VMs.

To install `Micro` on a virtual machine, run `mocaccino-unattended-installer`.

## Default username

The default account is `root` with password `mocaccino`

## SSH Access

add `PermitRootLogin yes` to `/etc/ssh/sshd_config` with your editor of choice ( for nano, `luet install editors/nano` )

Start the sshd daemon:

```bash
$ runit-start sshd
```

You should be able to log-in to your machine, check the ip with `ip a`.

To enable sshd on boot,

```bash
$ runit-enable sshd
```

Once logged in, remind to change the configuration settings!
