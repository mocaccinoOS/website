---
title: "Network configuration"
linkTitle: "Network configuration"
weight: 3
description: >-
     Configure your network
---

## Network Manager

By default your system is configured with dhcp using Netwok Manager.
Currently Network Manager is installed on the system as a part of layers/X.

## systemd-networkd

If you want to use systemd-networkd instead of Network Manager follow these steps.

First disable Network Manager service and enable systemd-networkd service:
```bash
root@mocaccino:~# systemctl stop NetworkManager
root@mocaccino:~# systemctl disable NetworkManager
root@mocaccino:~# systemctl enable systemd-networkd
```
Enable the systemd-resolved service:
```bash
root@mocaccino:~# systemctl enable systemd-resolved
root@mocaccino:~# systemctl start systemd-resolved
```
Configure your connection:
To list available connectiond you can run networkctl
```bash
root@mocaccino:~# networkctl
```
This will display a list like this:
```bash
IDX LINK        TYPE     OPERATIONAL SETUP     
  1 lo          loopback carrier     unmanaged
  2 enp3s0      ether    routable    configured
  3 enp2s0      ether    off         unmanaged
  4 edgevpn0    none     routable    unmanaged
  5 docker0     bridge   routable    unmanaged
  7 vethf4478cf ether    enslaved    unmanaged
  9 veth65a81ba ether    enslaved    unmanaged
 11 veth6df3fd4 ether    enslaved    unmanaged

8 links listed.
```
In our example we want to configure enp3s0

Static config:
```bash
root@mocaccino:~# nano /etc/systemd/network/00-enp3s0.network
```
And as an example add this to the file
```bash
[Match]
Name=enp3s0

[Network]
Address=192.168.1.50/24
Gateway=192.168.1.1
DNS=192.168.1.1
```
DHCP:
We edit the same file as above but now we put in this config
```bash
[Match]
Name=enp3s0

[Network]
DHCP=yes
```
