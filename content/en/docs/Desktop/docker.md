---
title: "Running docker"
linkTitle: "Docker"
weight: 5
description: >-
     Running Docker on Mocaccino Desktop
---

# Setup

First install `container/docker` and `systemd-service/dockerd`, which provides the `systemd` service:

```bash
$ luet install container/docker systemd-service/dockerd
```

To start dockerd, just:
```bash
$ systemctl start docker
```

or to enable at boot:

```bash
$ systemctl enable docker
```

Optionally add your user to the docker group:

```
$ sudo usermod -aG docker $USER
```
Now you should be able to use docker as usual, for example:

```bash

root@mocaccino:~# docker ps -a
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
root@mocaccino:~# docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
quay.io/mocaccino/extra   latest              ce197d5b1a7e        3 days ago          21.2MB

```
