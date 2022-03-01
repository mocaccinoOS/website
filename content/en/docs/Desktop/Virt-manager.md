---
title: "Virt-manager"
linkTitle: "Installing virt-manager"
weight: 100
description: >-
     Installing virt-manager in Mocaccino Desktop
---

# Setup

Install virt-manager using Luet:

```bash
# luet install apps/virt-manager
```

edit `/etc/libvirt/libvirtd.conf` and uncomment these lines:

`unix_sock_group = "libvirt"`

`unix_sock_ro_perms = "0777"`

`unix_sock_rw_perms = "0770"`

```bash
# usermod -aG libvirt username
```
```bash
# usermod -aG kvm username
```
Enable and start the libvirtd systemd service
```bash
# systemctl enable libvirtd
```
```bash
# systemctl start libvirtd
```
