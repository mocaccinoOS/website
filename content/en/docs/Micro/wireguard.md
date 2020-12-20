---
title: "Running wireguard"
linkTitle: "Wireguard"
weight: 6
description: >-
     Running Wireguard on Mocaccino Micro
---

# Setup

Wireguard comes embedded in the Mocaccino Kernels.

First install wireguard-tools and the `wg` runit service:

```bash
$ luet install runit-srv/wg networking/wireguard-tools
```

By default, the service sets up the `wg0` interface, with configuration at `/etc/wireguard/wg0.conf`.

Edit `/etc/wireguard/wg0.conf` with your configuration, or to change the default interface configuration, change the `/etc/sv/wg/conf` file accordingly.


To start wg, just:
```bash
$ runit-start wg
```

or to enable at boot:

```bash
$ runit-enable wg
```

Now you should be able to see the wg interface with `wg show`.

## Multiple connections

For multiple connections, copy the `/etc/sv/wg/` service directory to your custom one, for example `/etc/sv/wg2` and tweak it accordingly to your needs.
You can start it afterwards with `runit-start wg2`
