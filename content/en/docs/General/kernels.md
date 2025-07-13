---
title: "Switching kernels"
linkTitle: "Switching kernels"
weight: 3
description: >-
     Switching between LTS and mainline kernels
---

## Switching kernels

MocaccinoOS images are shipping the latest LTS available Kernel version by default. It is possible to switch kernels by running `mos kernel-switcher`. 

### List available kernels

```bash
$ mos kernel-switcher list
```

### Switch to main kernels

To switch to main kernels, that gets updated more frequently:

```bash
$ mos kernel-switcher switch kernel/mocaccino-full
```

### Switch to LTS kernels

To switch to LTS kernels, run:

```bash
$ mos kernel-switcher switch kernel/mocaccino-lts-full
```

{{< alert color="warning" title="Warning" >}}
Please note that due a [bug](https://github.com/mocaccinoOS/mocaccino/issues/109) you might end up without a working initramfs causing the system to fail to boot.
Make sure you have the proper kernel/mocaccino-lts-initramfs or kernel/mocaccino-initramfs installed before rebooting the system!
{{< /alert >}}
