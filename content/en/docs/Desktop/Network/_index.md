---
title: "Network configuration"
linkTitle: "Network configuration"
weight: 70
description: >-
  Configure networking on MocaccinoOS using Network Manager or systemd-networkd.
---

# Network configuration

MocaccinoOS uses **Network Manager** to manage network connections by default. It handles wired and wireless connections automatically and can be controlled via the `nmcli` command line tool, a graphical applet in your desktop environment, or the `nmtui` text interface.

For users who prefer a more minimal setup, **systemd-networkd** is also available as an alternative.

---

## Network Manager

### Checking status

To verify Network Manager is running and connected:

```bash
nmcli general status
```

To list all network interfaces and their state:

```bash
nmcli device status
```

To list all configured connection profiles:

```bash
nmcli connection show
```

---

### Wi-Fi

Scan for available networks:

```bash
nmcli device wifi list
```

Connect to a network:

```bash
nmcli device wifi connect <SSID> password <password>
```

Disconnect from Wi-Fi:

```bash
nmcli device disconnect <interface>
```

To enable or disable Wi-Fi:

```bash
nmcli radio wifi on
nmcli radio wifi off
```

---

### Wired (Ethernet)

Wired connections are configured automatically via DHCP when a cable is plugged in. If you need to set a static IP address on a connection, see the [Static IP](#static-ip) section below.

To bring a wired connection up or down manually:

```bash
nmcli connection up <connection-name>
nmcli connection down <connection-name>
```

---

### Static IP

To assign a static IP address to an existing connection:

```bash
nmcli connection modify <connection-name> ipv4.method manual ipv4.addresses 192.168.1.50/24 ipv4.gateway 192.168.1.1 ipv4.dns 192.168.1.1
```

Then bring the connection back up to apply the changes:

```bash
nmcli connection up <connection-name>
```

To revert back to DHCP:

```bash
nmcli connection modify <connection-name> ipv4.method auto
nmcli connection up <connection-name>
```

---

### nmtui

If you prefer a simple text-based interface over the command line, Network Manager includes `nmtui`. Launch it with:

```bash
nmtui
```

This opens a menu-driven interface where you can add, edit, and activate connections without needing to remember `nmcli` syntax.

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
IDX LINK    TYPE     OPERATIONAL SETUP
  1 lo      loopback carrier     unmanaged
  2 enp3s0  ether    routable    configured
  3 enp2s0  ether    off         unmanaged
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

## Firewall

MocaccinoOS includes the Linux kernel's **nftables** firewall framework and the `nft` userspace utility. By default, no firewall rules are configured, allowing you to create a ruleset that matches your requirements.

A minimal configuration can be placed in `/etc/nftables.conf`:

```nft
#!/usr/sbin/nft -f

flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0;
        policy drop;

        # Allow loopback
        iif lo accept

        # Allow established and related connections
        ct state established,related accept

        # Drop invalid packets
        ct state invalid drop

        # Allow ICMP
        ip protocol icmp accept
        ip6 nexthdr ipv6-icmp accept

        # Allow SSH (optional)
        tcp dport 22 accept
    }

    chain forward {
        type filter hook forward priority 0;
        policy drop;
    }

    chain output {
        type filter hook output priority 0;
        policy accept;
    }
}
```

Enable the firewall at boot:

```bash
systemctl enable --now nftables
```

View the active ruleset:

```bash
nft list ruleset
```

Open additional services by adding the appropriate ports to the `input` chain. For example:

- SSH: `22/tcp`
- HTTP: `80/tcp`
- HTTPS: `443/tcp`
- FTP: `21/tcp` (plus the configured passive port range)
- Samba: `445/tcp` (and NetBIOS ports if required)