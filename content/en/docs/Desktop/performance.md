---
title: "Performance Optimizations"
linkTitle: "Performance"
weight: 110
description: >-
    Optimizing MocaccinoOS for enhanced performance.
---

# MocaccinoOS Performance Optimizations

MocaccinoOS ships with carefully selected **system and network optimizations** designed for:

- Desktop responsiveness  
- Gaming performance  
- Low-latency networking  
- Efficient filesystem behavior  

Most users do **not** need to change anything.

- Core optimizations are **enabled by default**.
- Additional examples are provided for advanced tuning.
- Changes in `/usr/lib/sysctl.d/70-mocaccino.conf` are **overwritten on updates**.
- To make permanent adjustments, create:

```
/etc/sysctl.d/99-custom.conf
```

---

## Default Optimizations (Already Enabled)

The following settings are applied by default.

---

## Network Performance Tweaks

### FQ (Fair Queuing) — Reduced Bufferbloat

```ini
net.core.default_qdisc=fq
```

Improves packet scheduling and reduces latency spikes under load.

---

### BBR Congestion Control — Low Latency + High Throughput

```ini
net.ipv4.tcp_congestion_control=bbr
```

BBR improves:

- Latency consistency
- Throughput on modern broadband
- Performance during uploads or downloads

Verify:

```bash
sysctl net.ipv4.tcp_congestion_control
```

---

## Memory Management Optimizations

### Reduce Swap Usage (Desktop Responsiveness)

```ini
vm.swappiness=10
```

Lower swappiness:

- Reduces background swapping  
- Keeps active applications in RAM  
- Improves gaming smoothness  

---

### Optimize Disk Writeback (Reduce Micro-Stutters)

```ini
vm.dirty_background_ratio=3
vm.dirty_ratio=8
vm.dirty_expire_centisecs=1200
vm.dirty_writeback_centisecs=500
```

Linux buffers disk writes in memory ("dirty pages") before flushing them to disk. These settings:

- Start writeback earlier
- Reduce maximum dirty memory
- Smooth disk I/O
- Improve UI responsiveness

Trade-off: slightly reduced peak sequential write throughput.

---

### Reduce VFS Cache Pressure

```ini
vm.vfs_cache_pressure=50
```

Keeps metadata and directory cache longer, benefiting:

- Gaming workloads  
- Development environments  
- Large source trees  

---

## Filesystem & Process Optimizations

### Increase inotify Limits (IDEs, Docker, Game Engines)

```ini
fs.inotify.max_user_watches=524288
fs.inotify.max_user_instances=1024
```

Prevents file monitoring limits from being reached in large projects.

---

## Customizing TCP Buffer Sizes

MocaccinoOS provides **example profiles** for different workloads.

> **Warning:** Only one profile should be used at a time.

### Low Latency (Gaming, Voice Chat, Video Calls)

```ini
net.core.rmem_max=4194304
net.core.wmem_max=4194304
net.ipv4.tcp_rmem=4096 87380 4194304
net.ipv4.tcp_wmem=4096 16384 4194304
```

Optimized for latency stability over maximum throughput.

---

### High Bandwidth (File Transfers, Streaming, NAS)

```ini
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
```

Apply permanently by copying the profile into:

```
/etc/sysctl.d/99-custom.conf
```

Reload settings:

```bash
sudo sysctl --system
```

---

## Adjusting vm.max_map_count (Advanced Users)

Default:

```ini
vm.max_map_count=65530
```

Some applications require higher limits:

- Elasticsearch  
- Game engines  
- AI / ML workloads  
- Certain modern games  

Example: Increase to 262144

```bash
echo "vm.max_map_count=262144" >> /etc/sysctl.d/99-custom.conf
sudo sysctl --system
```

Recommended Values:

| Use Case | Value |
|----------|-------|
| Default Linux | 65530 |
| Elasticsearch / Databases | 262144 |
| High-performance workloads | 1048576+ |

The game **DayZ** requires `1048576`[^1].

---

## How to Apply Changes

After modifying `/etc/sysctl.d/99-custom.conf`:

```bash
sudo sysctl --system
```

Verify any setting:

```bash
sysctl <setting>
```

Example:

```bash
sysctl net.ipv4.tcp_congestion_control
```

---

## FAQ

### What happens if I edit `/usr/lib/sysctl.d/70-mocaccino.conf`?

⚠ Do **NOT** edit this file. It will be overwritten during system updates. Always use `/etc/sysctl.d/99-custom.conf`.

---

### How do I restore default settings?

Delete your custom file:

```bash
sudo rm /etc/sysctl.d/99-custom.conf
sudo sysctl --system
```

---

## Summary

✔ MocaccinoOS includes performance optimizations by default  
✔ Network, memory, and filesystem tuning are preconfigured for desktop use  
✔ Advanced users can override settings safely via `/etc/sysctl.d/99-custom.conf`  
✔ Changes in `/usr/lib/sysctl.d/` are not persistent across updates  

These defaults are designed to balance **performance, stability, and responsiveness** for modern desktop systems.

[^1]: https://steamcommunity.com/app/221100/discussions/0/3199241400256965913/#c3199241400263431941

