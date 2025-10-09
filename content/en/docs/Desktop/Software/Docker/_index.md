---
title: "Running docker"
linkTitle: "Docker"
weight: 4
description: >-
     Running Docker on Mocaccino Desktop
---

# Setup

First install `container/docker` and `systemd-service/dockerd`, which provides the `systemd` service:

```bash
$ sudo luet install container/docker systemd-service/dockerd
```

To start dockerd, just:
```bash
$ sudo systemctl start docker
```

or to enable at boot:

```bash
$ sudo systemctl enable docker
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
you could also use [Whalebrew ](/docs/desktop/software//whalebrew) to make aliasing the containers into something more useable. 

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to use a YAML file (conventionally named docker-compose.yml) to configure all of your application's services.

Docker Compose is available in the [community repository](/docs/desktop/luet/repositories/#community-repository) as part of the apps/docker-tools package. If you have enabled this repository you can install it by using this command:

```bash

$ sudo luet install apps/docker-tools

```

