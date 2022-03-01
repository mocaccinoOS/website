---
title: "Virt-manager"
linkTitle: "Installing virt-manager"
weight: 100
description: >-
     Page description for heading and indexes.
---

## Installing virt-manager

luet install apps/virt-manager

edit /etc/libvirt/libvirtd.conf and uncomment these lines:
unix_sock_group = "libvirt"
unix_sock_ro_perms = "0777"
unix_sock_rw_perms = "0770"

usermod -aG libvirt joost
usermod -aG kvm joost

systemctl enable libvirtd
systemctl start libvirtd
