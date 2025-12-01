---
title: "Virt-manager"
linkTitle: "Virt-manager"
weight: 22
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
$ sudo usermod -aG libvirt $USER
```
Add your user to the kvm group
```bash
$ sudo usermod -aG kvm $USER
```
Enable and start the libvirtd systemd service
```bash
$ sudo systemctl enable libvirtd
```
```bash
$ sudo systemctl start libvirtd
```

## Networking

By default libvirt comes with no network configured by default.

You can check that by running:

```bash
$ sudo virsh net-list --all

Name                 State      Autostart     Persistent
----------------------------------------------------------
```

Create the default network by copy-pasting the following lines into a file called default.xml

```xml
<network>
  <name>default</name>
  <uuid>9a05da11-e96b-47f3-8253-a3a482e445f5</uuid>
  <forward mode='nat'/>
  <bridge name='virbr0' stp='on' delay='0'/>
  <mac address='52:54:00:0a:cd:21'/>
  <ip address='192.168.122.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.122.2' end='192.168.122.254'/>
    </dhcp>
  </ip>
</network>
```

Now add it:
```bash
$ sudo virsh net-define --file default.xml
```

To start it, run:
```bash
$ sudo virsh net-start default
```

Start it permanently by default:

```bash
$ sudo virsh net-autostart --network default
```

## References

- https://blog.programster.org/kvm-missing-default-network
