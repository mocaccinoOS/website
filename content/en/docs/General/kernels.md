---
title: "Switching kernels"
linkTitle: "Switching kernels"
weight: 3
description: >-
     Switching between the LTS and stable kernel
---

## Switching kernels

MocaccinoOS images are shipping the latest available LTS kernel version by default. It is possible to switch kernels by running `mos kernel-switcher`. 

### List available kernels

```bash
$ sudo mos kernel-switcher list
```

### Switch to the stable kernel

To switch to the stable kernel, that gets updated more frequently:

```bash
$ sudo mos kernel-switcher switch kernel/mocaccino-full
```

### Switch to the LTS kernel

To switch to the LTS kernel run:

```bash
$ sudo mos kernel-switcher switch kernel/mocaccino-lts-full
```

{{< alert color="warning" title="Warning" >}}
Please note that due a [bug](https://github.com/mocaccinoOS/mocaccino/issues/109) you might end up without a working initramfs causing the system to fail to boot.
Make sure you have the proper kernel/mocaccino-lts-initramfs or kernel/mocaccino-initramfs installed before rebooting the system!
{{< /alert >}}
