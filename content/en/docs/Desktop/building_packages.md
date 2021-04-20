---
title: "Building packages locally"
linkTitle: "Building packages locally"
weight: 100
description: >-
     How to build packages on MocaccinoOS with portage (or not)
---

{{< alert color="warning" title="Warning" >}}
Building packages is a complex topic. Installing packages coming from untrusted repositories, or building packages in the *wrong* way might break your system.

The following steps should only be carried out on test systems. Do make sure you have any important data backed up before installing any package.

{{< /alert >}}

MocaccinoOS desktop, even if based on portage, doesn't support the direct usage of `emerge`. Although it's possible to compile and install packages from portage.

To build a system package, instead use `luet build`. The following document tries to summarize the steps to build a package with emerge with `luet build`, and install and track it in a MocaccinoOS Desktop system, should cover the scenario: *"hey, can I install packages with emerge?"*.

## Requirements

- Be sure to have [docker](/docs/desktop/docker) installed, and the daemon running. The document is assuming you are carrying the steps on MocaccinoOS Desktop (GNOME in the specific case). 
- At least 30G of free disk space. To reclaim the space afterwards, run `docker system prune --force --volumes --all`

Follow the steps described in [this document](/docs/desktop/docker) before going ahead.

## Create a workspace

First of all, let's create a workspace. The packages that we will build have to persist somewhere in your local system, the location must be accessible while performing a `luet upgrade`. We will use `/user/system_repository` as an example. And we will assume the commands are running as root.

```bash
$ mkdir -p /user/system_repository/tree
$ cd /user/system_repository
```

All the commands from now on will be carried from the `/user/system_repository` directory.

## First package

Let's put our eyes on, let's say, [games-board/gnome-chess](https://packages.gentoo.org/packages/games-board/gnome-chess), and create a compilation definition for it.

Let's first declare it's canonical name, or how you would actually install it afterwards with `luet` (e.g. `luet install app/gnome-chess`)

```bash
$ mkdir tree/gnome-chess
$ cat <<EOF >>tree/gnome-chess/definition.yaml
category: "apps"
name: "gnome-chess"
version: "0.1"
EOF
```

Here the version doesn't really matter, it's mostly for you to keep it track in your system. You can decide to follow strictly the versioning from gnome-chess, or not.

Now let's get to the important part, the build definition. This tells luet how to compile your package:

```bash
$ cat <<EOF >>tree/gnome-chess/build.yaml
steps:
- emerge games-board/gnome-chess
requires:
- category: "layers"
  name: "gnome"
  version: ">=0"
EOF
```

as you see, we are using emerge here to compile the package. The requires section tells from where it runs the command, which in this case is the MocaccinoOS desktop gnome layer. To see all the layers available, run `luet search layers` or to see the currently installed, you can run `luet search --installed layers`). 


{{< alert color="primary" title="Note" >}}
Even if the example shows how to build a package with emerge, it is although possible to create packages out from any docker image - even not by compiling. You have to be careful to check if any package dependencies are actually already shipped by the layers

{{< /alert >}}

## Building the package

Now let's build the packages (remember to run as root, or with `sudo` upfront):

```bash
$ luet build --tree tree --pull --pull-repository quay.io/mocaccinocache/desktop --from-repositories --live-output --only-target-package apps/gnome-chess
```
{{< alert color="primary" title="Note" >}}
The first time can take up some time due to downloading the images, but those are cached locally for local iteration. Time for a coffee!
{{< /alert >}}

After build is completed, generate the repository metadata:

```bash
$ luet create-repo --tree tree
```

## Install the package

First let's consume the repository we just created in our system:

```bash
$ cat <<EOF >> /etc/luet/repos.conf.d/local.yaml
name: "local-repository"
description: "Local repository"
type: "disk"
enable: true
cached: true
priority: 99
urls: # Repository URLs
  - /user/system_repository/build
EOF
```

Now we are ready to install `gnome-chess` locally:

```bash
$ luet install apps/gnome-chess
```

## Advanced topics

### Showing package files

Luet shows already all the files shipped by a package with `luet search`. For example:

```bash
$ luet search apps/gnome-chess -o yaml
```

### Find duplicate files shipped by packages

You can check duplicate files into the package shipped by repositories, also before installing them:

```bash
luet search -o json | luet filter
```

This is particularly useful to check for any conflicting files with the system packages and the ones you are generating.

See also the [dev section](/docs/desktop/development/howdoi/#how-do-i-find-the-duplicate-files-in-the-package-repositories) regarding duplicate files.

### Removing generated docker images

By default, images are tagged under `luet/cache`. So it's possible to remove all the cache images generated by removing the `luet/cache` and `quay.io/mocaccinocache/desktop` images, although, you should also prune afterwards the images not referenced anymore by any tag with `docker image prune`:

```bash
docker rmi luet/cache && docker rmi quay.io/mocaccinocache/desktop && docker image prune
```

A way to reclaim all the space occupied by docker more aggressively is by running `docker system prune`, but attention, this command will remove all the images, also the ones which weren't generated by `luet`:

```bash
docker system prune --force --volumes --all
```


## References
- [Luet docs](https://luet-lab.github.io/docs)
- [Luet Packages](https://luet-lab.github.io/docs/docs/concepts/packages/)
- [Luet hello world](https://luet-lab.github.io/docs/docs/tutorials/hello_world/)