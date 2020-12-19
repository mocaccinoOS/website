---
title: "Switching kernels"
linkTitle: "Switching kernels"
weight: 3
description: >-
     Switching between LTS and mainline kernels
---

## Switching kernels

`Micro` and `MicroServer` images are shipping the latest available Kernel version. It is possible to switch kernels by running `luet kernel-switcher`. 

`kernel-switcher` is a luet extension, and is shipped by `system/luet-extensions`.

### Switch to LTS kernels

To switch to LTS kernels, run:

```bash
$ luet kernel-switcher kernel/mocaccino-lts-full
```

### Switch to main kernels

To switch to main kernels, that gets updated more frequently:

```bash
$ luet kernel-switcher kernel/mocaccino-full
```
