---
title: "Mocaccino Micro"
linkTitle: "Mocaccino Micro"
weight: 10
---

{{< alert color="warning" title="Warning" >}}
Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before.
{{< /alert >}}

[Mocaccino Micro](https://github.com/mocaccinoOS/mocaccino-micro) is a musl-based LFS distribution with a minimal set of packages in order to boot and build an entire OS. 

[At the moment are available alpha ISO releases](https://get.mocaccino.org/minio/mocaccino-iso), and the following [docker images](https://quay.io/repository/mocaccino/micro) can be used:

```bash
$ docker pull quay.io/mocaccino/micro
```

## Init system

The `Micro` and `MicroServer` ISO flavors are using `runit` as `init` system. For ease of use, a __very simple__ helper is provided, and can be used as follows:

### List available services

```bash
$ runit-list
```

### Start a service

```bash
$ runit-start sshd
```

### Stop a service

```bash
$ runit-stop sshd
```

### Enable a service on boot

```bash
$ runit-enable sshd
```

### Disable a service from booting on startup

```bash
$ runit-disable sshd
```

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

## Extra repositories

Additional packages are available in the [mocaccino-extra](https://github.com/mocaccinoOS/mocaccino-extra) repositories.

To enable them:

```bash
$ luet install repository/mocaccino-extra
```
