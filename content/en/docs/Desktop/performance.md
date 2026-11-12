---
title: "Performance Optimizations"
linkTitle: "Performance"
weight: 110
description: >-
    Optimizing MocaccinoOS for enhanced performance.
---

MocaccinoOS ships with system and network optimizations for desktop responsiveness, gaming and low-latency networking. Most users do not need to change anything.

This page lists the default optimizations, explains how to customize them, and describes two optional features that are off by default.

## Default optimizations

The defaults are set in `/usr/lib/sysctl.d/70-mocaccino.conf`.

### Network

```ini
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
```

FQ (Fair Queuing) improves packet scheduling and reduces latency spikes under load. BBR improves latency consistency and throughput on modern broadband.

To verify the congestion control algorithm:

```bash
$ sysctl net.ipv4.tcp_congestion_control
```

### Memory

```ini
vm.swappiness=10
vm.dirty_background_ratio=3
vm.dirty_ratio=8
vm.dirty_expire_centisecs=1200
vm.dirty_writeback_centisecs=500
vm.vfs_cache_pressure=50
```

- A low `vm.swappiness` keeps active applications in RAM instead of swapping them out.
- The `vm.dirty_*` settings start writing buffered data to disk earlier and limit how much can build up. This smooths disk I/O and reduces micro-stutters, at the cost of slightly lower peak sequential write throughput.
- A lower `vm.vfs_cache_pressure` keeps filesystem metadata cached longer, which helps games, development environments and large source trees.

### Filesystem

```ini
fs.inotify.max_user_watches=524288
fs.inotify.max_user_instances=1024
```

These higher inotify limits prevent file monitoring errors in IDEs, Docker and game engines working with large projects.

## Customizing settings

Changes to `/usr/lib/sysctl.d/70-mocaccino.conf` are overwritten on updates. Put your own settings in `/etc/sysctl.d/99-custom.conf` instead.

After changing the file, apply the settings:

```bash
$ sudo sysctl --system
```

To check a single setting:

```bash
$ sysctl <setting>
```

To restore the defaults, delete your custom file and reload:

```bash
$ sudo rm /etc/sysctl.d/99-custom.conf
$ sudo sysctl --system
```

### TCP buffer sizes

Two example profiles are available. Use only one at a time.

For gaming, voice chat and video calls (favors latency over maximum throughput):

```ini
net.core.rmem_max=4194304
net.core.wmem_max=4194304
net.ipv4.tcp_rmem=4096 87380 4194304
net.ipv4.tcp_wmem=4096 16384 4194304
```

For file transfers, streaming and NAS (favors throughput):

```ini
net.core.rmem_max=16777216
net.core.wmem_max=16777216
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
```

### vm.max_map_count

The default is `65530`. Some applications need a higher limit, such as Elasticsearch, game engines, AI/ML workloads and certain modern games. For example, to set it to 262144:

```bash
$ echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.d/99-custom.conf
$ sudo sysctl --system
```

Recommended values:

| Use case | Value |
| --- | --- |
| Default Linux | 65530 |
| Elasticsearch / databases | 262144 |
| High-performance workloads | 1048576+ |

The game DayZ requires `1048576`[^1].

## Optional: CPU-optimized graphics libraries

MocaccinoOS is built for the baseline x86-64 instruction set so it runs on every x86-64 CPU. The optional `layers/X-v3` layer provides graphics and media libraries rebuilt for the **x86-64-v3** level (AVX, AVX2, FMA, BMI1/BMI2), supported by Intel Haswell / AMD Excavator and newer CPUs (about 2013 and later).

The layer contains Mesa, Vulkan-loader, libepoxy, libglvnd, GLEW, FFmpeg and OpenAL. More libraries are planned. They are installed in `/usr/lib64/glibc-hwcaps/x86-64-v3/`.

glibc (2.33 and newer) checks at every process launch whether the CPU supports v3. If it does, the optimized libraries are used. If it does not, the normal system libraries are used. No configuration is needed, so installing the layer is safe on any CPU.

This command installs the layer:

```bash
$ sudo luet install layers/X-v3
```

The layer is not part of the graphical installer.

The expected gain is small:

- Mesa, Vulkan-loader, libepoxy, libglvnd and GLEW mostly pass work between the game and the GPU driver. In GPU-bound scenarios, which is most gaming at higher resolutions, there is little room to matter. CPU-bound cases such as very high refresh-rate games or a weak CPU with a strong GPU may benefit slightly.
- FFmpeg already uses hand-written SIMD code with runtime CPU detection for its main codecs, so the standard build already gets most of the AVX2 benefit.

One user comparing an x86-64-v3 Proton build to a standard build on capable AMD hardware measured no additional FPS[^2]. If you notice no difference, that is an expected result, not a bug.

## Optional: sched_ext schedulers

The CPU scheduler decides which program runs on which core, and when. Linux uses EEVDF by default. **sched_ext** (kernel 6.12 and newer) lets you load an alternative scheduler while the system is running, without a reboot or a kernel rebuild.

The Stable and LTS kernels ship with sched_ext enabled. Nothing changes until you load a scheduler yourself. If the kernel detects a scheduling problem, it falls back to the default scheduler automatically[^3].

Enabling sched_ext requires a few supporting kernel options (BTF type information, function tracing hooks and some BPF settings). This adds a few megabytes of type information to the kernel for everyone. The tracing hooks should have a negligible effect when tracing is not in use.

Update to the latest kernel, reboot, and install the schedulers:

```bash
$ sudo luet install apps/scx
```

Start a scheduler from a terminal:

```bash
$ sudo scx_lavd
```

To check that it is active, run this in another terminal:

```bash
$ cat /sys/kernel/sched_ext/state
enabled
$ cat /sys/kernel/sched_ext/root/ops
```

Press `Ctrl+C` to stop the scheduler and return to the default one. A scheduler started this way also stops at reboot.

`scx_lavd` (aimed at gaming and interactive use) and `scx_bpfland` (aimed at low response times) have been verified to load and run on MocaccinoOS kernels. Other schedulers from the scx project have not been tried, and none have been benchmarked on MocaccinoOS yet.

Results depend on the workload:

- The `scx_lavd` developers report higher frame rates, fewer stutters and slightly lower power use in games[^3]. This is their measurement on their workloads.
- In a third-party benchmark (June 2026) of compiling and stress tests, EEVDF was essentially tied for fastest, while `scx_lavd` took roughly 8% longer in total[^4]. Schedulers tuned for low latency may give up some raw throughput.
- In GPU-bound games, the CPU scheduler has little room to matter.

If a scheduler does not help your workload, stop it and carry on with the default.

[^1]: https://steamcommunity.com/app/221100/discussions/0/3199241400256965913/#c3199241400263431941
[^2]: https://forums.linuxmint.com/viewtopic.php?t=457800
[^3]: https://lwn.net/Articles/991205/
[^4]: https://reddit.sentinel-team.org/posts/1u5uf16/snapshots/2026-06-19T21%3A03%3A49.564114Z