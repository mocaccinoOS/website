---
title: "Running docker"
linkTitle: "Docker"
weight: 5
description: >-
     Running Docker on Mocaccino Micro
---

# Setup

First install `container/docker`, or directly `runit-srv/docker`, which provides the `runit` service:

```bash
$ luet install runit-srv/docker
```

To start dockerd, just:
```bash
$ runit-start dockerd
```

or to enable at boot:

```bash
$ runit-enable dockerd
```

Now you should be able to use docker as usual, for example:

```bash

root@mocaccino:~# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
root@mocaccino:~# docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
quay.io/mocaccino/extra   latest              ce197d5b1a7e        3 days ago          21.2MB

```
