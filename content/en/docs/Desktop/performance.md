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
- Optional, opt-in features (CPU-optimized libraries, alternative CPU schedulers) are **off by default**.
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

## Optional Optimizations (Opt-in)

The following features are **not enabled by default**. Nothing changes in how your system behaves unless you opt in.

> **Set expectations:** both features below give workload-dependent results. You may see smoother performance, nothing noticeable, or in some cases a slowdown. If it doesn't help for your workload, that is a legitimate outcome, not a bug.

---

### CPU-Optimized Graphics Libraries (x86-64-v3)

MocaccinoOS targets the baseline x86-64 instruction set so it runs on every x86-64 CPU. Newer CPUs support more. The x86-64 psABI defines standard levels:

| Level | Instructions | Hardware |
|-------|--------------|----------|
| v2 | SSE3/SSSE3/SSE4.1/SSE4.2, POPCNT | Nehalem/Bulldozer and newer (~2008+) |
| v3 | AVX, AVX2, FMA, BMI1/BMI2, and more | Haswell/Excavator and newer (~2013+) |
| v4 | AVX-512 | Narrow slice of hardware |

v3 covers essentially all mainstream desktop and gaming CPUs of the last decade, both Intel and AMD.

#### What it is

The optional `layers/X-v3` layer provides graphics and media libraries rebuilt for x86-64-v3:

- Mesa
- Vulkan-loader
- libepoxy
- libglvnd
- GLEW
- FFmpeg
- OpenAL

More libraries are planned. They are installed into `/usr/lib64/glibc-hwcaps/x86-64-v3/`.

This uses a mechanism supported by glibc since 2.33. At every process launch, the dynamic linker checks whether the CPU supports v3:

- **CPU supports v3** → the optimized libraries are used automatically.
- **CPU does not support v3** → the normal system libraries are used.

No detection script or configuration is needed.

#### Install

```bash
sudo luet install layers/X-v3
```

It is not part of the graphical installer (yet).

#### What to expect

- **Mesa, Vulkan-loader, libepoxy, libglvnd, GLEW** are mostly dispatch and glue code between the application and the GPU driver. In GPU-bound scenarios (most gaming at higher resolutions) there is very little room to matter.
- It can matter slightly more in CPU-bound scenarios: very high refresh-rate competitive titles, draw-call-heavy games, or a weak CPU paired with a strong GPU.
- **FFmpeg** already uses hand-written SIMD code with runtime CPU detection for its main codecs (libx264, libx265, dav1d, and others), so the standard build already gets most of the AVX2 benefit.

One user comparing an x86-64-v3 Proton build against a standard build on capable AMD hardware measured no additional FPS[^2]. Expect something small, or nothing noticeable.

---

### sched_ext (Alternative CPU Schedulers)

The CPU scheduler decides which program runs on which core, and when. Linux uses **EEVDF** by default (replacing CFS in kernel 6.6). **sched_ext** (kernel 6.12+) allows a scheduler to be written as a BPF program and loaded while the system is running: no reboot, no kernel rebuild.

The MocaccinoOS **Stable** and **LTS** kernels ship with sched_ext enabled. Nothing changes until you load a scheduler yourself. If the kernel detects a scheduling problem, it automatically falls back to the default scheduler[^3].

#### Cost of enabling it

sched_ext requires a few supporting kernel options (BTF type information, function tracing hooks, some BPF settings). For everyone, this means a few megabytes of extra type information in the kernel. The tracing hooks should be negligible when tracing is not in use.

#### Try it

Update to the latest kernel, reboot, then install the schedulers:

```bash
sudo luet install apps/scx
```

Start one from a terminal:

```bash
sudo scx_lavd
```

Check that it is active from another terminal:

```bash
cat /sys/kernel/sched_ext/state
cat /sys/kernel/sched_ext/root/ops
```

Press `Ctrl+C` to stop it; the kernel returns to the default scheduler. A scheduler started this way also stops at reboot.

#### Verified schedulers

| Scheduler | Aimed at | Status |
|-----------|----------|--------|
| `scx_lavd` | Gaming and interactive use | Loads and runs, reported active by the kernel |
| `scx_bpfland` | Low response times | Loads and runs, reported active by the kernel |

Other schedulers from the scx project have not been tried. MocaccinoOS has not benchmarked any of them yet.

#### What to expect

- The `scx_lavd` developers report higher frame rates, fewer stutters and slightly lower power use in games compared to the default scheduler[^3]. That is their measurement on their workloads.
- In a third-party benchmark (June 2026) of throughput-style workloads such as compiling and stress tests, EEVDF was essentially tied for fastest, while `scx_lavd` took roughly 8% longer in total[^4]. Schedulers tuned for low latency may trade away some raw throughput.
- In GPU-bound games, the CPU scheduler has little room to matter.

---

## Summary

✔ MocaccinoOS includes performance optimizations by default  
✔ Network, memory, and filesystem tuning are preconfigured for desktop use  
✔ Advanced users can override settings safely via `/etc/sysctl.d/99-custom.conf`  
✔ Changes in `/usr/lib/sysctl.d/` are not persistent across updates  
✔ Optional x86-64-v3 libraries and sched_ext schedulers are available, off by default  

These defaults are designed to balance **performance, stability, and responsiveness** for modern desktop systems.

[^1]: https://steamcommunity.com/app/221100/discussions/0/3199241400256965913/#c3199241400263431941
[^2]: https://forums.linuxmint.com/viewtopic.php?t=457800
[^3]: https://lwn.net/Articles/991205/
[^4]: https://reddit.sentinel-team.org/posts/1u5uf16/snapshots/2026-06-19T21%3A03%3A49.564114Z
