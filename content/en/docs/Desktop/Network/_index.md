---
title: "Network configuration"
linkTitle: "Network configuration"
weight: 70
description: >-
  Configure your network on MocaccinoOS.
---

# Network configuration

MocaccinoOS uses **Network Manager** by default. If you prefer a more lightweight setup, you can switch to **systemd-networkd** instead.

---

## Network Manager

Network Manager is installed as part of the desktop layer and manages your connection automatically via DHCP out of the box. No additional configuration is needed for most users.

---

## systemd-networkd

If you prefer to use systemd-networkd instead of Network Manager, follow the steps below.

### 1. Switch services

Disable Network Manager and enable systemd-networkd:

```bash
systemctl stop NetworkManager
systemctl disable NetworkManager
systemctl enable --now systemd-networkd
```

Then enable systemd-resolved for DNS resolution:

```bash
systemctl enable --now systemd-resolved
```

### 2. Find your interface name

Run `networkctl` to list available network interfaces:

```bash
networkctl
```

Example output:

```
IDX LINK        TYPE     OPERATIONAL SETUP
  1 lo          loopback carrier     unmanaged
  2 enp3s0      ether    routable    configured
  3 enp2s0      ether    off         unmanaged
```

Note the name of the interface you want to configure (e.g. `enp3s0`).

### 3. Configure your interface

Create a configuration file for your interface:

```bash
nano /etc/systemd/network/00-enp3s0.network
```

**Static IP:**

```ini
[Match]
Name=enp3s0

[Network]
Address=192.168.1.50/24
Gateway=192.168.1.1
DNS=192.168.1.1
```

**DHCP:**

```ini
[Match]
Name=enp3s0

[Network]
DHCP=yes
```

After saving the file, restart the service to apply your changes:

```bash
systemctl restart systemd-networkd
```