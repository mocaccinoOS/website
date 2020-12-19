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

## Extra repositories

Additional packages are available in the [mocaccino-extra](https://github.com/mocaccinoOS/mocaccino-extra) repositories.

To enable them:

```bash
$ luet install repository/mocaccino-extra
```
