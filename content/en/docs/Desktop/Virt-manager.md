---
title: "Virt-manager"
linkTitle: "Virt-manager"
weight: 100
description: >-
     Installing virt-manager in Mocaccino Desktop
---

# Setup

Install virt-manager using Luet:

```bash
$ sudo luet install apps/virt-manager
```

edit `/etc/libvirt/libvirtd.conf` and uncomment these lines:

`unix_sock_group = "libvirt"`

`unix_sock_ro_perms = "0777"`

`unix_sock_rw_perms = "0770"`

Add your user to the libvirt group
```bash
$ sudo usermod -aG libvirt username
```
Add your user to the kvm group
```bash
$ sudo usermod -aG kvm username
```
Enable and start the libvirtd systemd service
```bash
$ sudo systemctl enable libvirtd
```
```bash
$ sudo systemctl start libvirtd
```
