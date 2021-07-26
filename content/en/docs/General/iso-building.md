---
title: "ISO building"
linkTitle: "ISO building"
weight: 3
description: >-
     Building ISOs for testing or custom ISOs.
---

## ISO Building

The ISO building process is performed within dockers to keep ISOs clean and uncontaiminated by unnecessary dev files, temp files, etc.

### Docker installation
If you're planning on using docker as a user rather than just from root, you'll want additional packages such as entity/docker and acct-group/docker, but they aren't necessary for our purposes.

```bash
root@mocaccino:~ # luet install container/docker systemd-service/dockerd```
root@mocaccino:~ # systemctl enable docker; systemctl start docker```
```
If you're using mocaccino-micro, you'll use runit-srv/dockerd instead of systemd-service.

```bash
root@mocaccino:~ # luet install container/docker runit-srv/dockerd```
root@mocaccino:~ # runit-enable dockerd; runit-start dockerd```
```

### Creating a Dockerfile

You'll need a dockerfile that tells docker how to build our image and what it should do. Lets start by creating a dedicated directory for this work.

```bash
root@mocaccino:~ # mkdir -p Docker/iso-builder
root@mocaccino:~/Docker/iso-builder# cd Docker/iso-builder
root@mocaccino:~/Docker/iso-builder# touch Dockerfile
root@mocaccino:~/Docker/iso-builder# vim Dockerfile
```
Now what do we need in this dockerfile?

```
FROM ubuntu
RUN apt-get update
RUN apt-get install curl xorriso squashfs-tools dosfstools
RUN curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
RUN luet install -y extension/makeiso
WORKDIR /output
ENTRYPOINT ["/usr/bin/luet-makeiso"]
```

So what exactly is happening here? We're telling docker we want our image to start **FROM** the ubuntu core image which is very small and extremely lean.
Then we're telling docker to **RUN** these commands inside the docker for setup. These command update the apt repos, install a few required tools, install luet via a script, and add the makeiso luet extension. Then we're saying we need a **WORKDIR** where we're going to output our file file and we want that to be a folder we link outside the docker so we can have that ISO outside of the docker. Then we're using **ENTRYPOINT** to tell docker after the image is built and started, what command do we want the docker to run? 

Want to start from Gentoo Stage3? Try this Dockerfile:

```
FROM gentoo/stage3:systemd
RUN rm -rf /var/lock
RUN mkdir -p /var/lock/
RUN touch /var/lock/luet.lock
RUN curl https://get.mocaccino.org/luet/get_luet_root.sh | sh
RUN luet install -y extension/makeiso
WORKDIR /output
ENTRYPOINT ["/usr/bin/luet-makeiso"]
```

### Building the docker image

Building the docker image and installing/running the docker container are different. Building the docker image means you have the starting point image built and ready, but doesn't mean the docker container installed and running. We'll be building and tagging this image with a name.

```bash
root@mocaccino:~/Docker/iso-builder# docker build -t iso-builder .
```

What is this command doing? Its telling **docker** to **build** the **Dockerfile** inside the current directory **(.)** and tag **(-t)** it with the name **iso-builder**. When this is complete you should see something like this at the end:

```bash
Successfully built af8d3b35de70
Successfully tagged iso-builder:latest
```

This means the docker image was successfully built and it has been tagged/named iso-builder:latest. What is with the ":latest"? Well you can have multiple revisions of docker and tag them with different version numbers. For example if I was maintaining 2 different versions such as how ubuntu LTS has multiple still supported versions we could tag it like :1804 and :2004, but for our usecases we won't be doing that. We'll just be using latest.

### Building the ISO

Now we have a docker image we can use to build clean ISOs from scratch, but we're still not done.  the **ENTRYPOINT** command luet-makeiso requires arguements. running the command alone doesn't just build an ISO. It needs instructions on the list of layers and packages to download and install to build a specific spin of MocaccinoOS. For the simplicity of the guide we'll just be using Gnome, but there are multiple Mocaccino flavors for you to choose from. You can build from a pre-built specification or you can tweak a specification to make your own ISO build. Our specification files are stored at https://github.com/mocaccinoOS/mocaccino/tree/master/specs.

Lets download the ```gnome.yaml``` spec file into our iso-builder directory.

```bash
root@mocaccino:~/Docker/iso-builder# curl https://raw.githubusercontent.com/mocaccinoOS/mocaccino/master/specs/gnome.yaml
```

Our iso-builder directory should now look like this:

```bash
root@mocaccino:~/Docker/iso-builder# ls
Dockerfile  gnome.yaml
```

Lets tell Docker to run our newly built docker container image and tell it to build us an ISO!

```bash
root@mocaccino:~/Docker/iso-builder# docker run -ti -v $PWD:/output --rm iso-builder:latest gnome.yaml
```

So whats happening here exactly? We're telling **docker** run a docker container using the **iso-builder:latest** image we built and we want to see the output run in a new tty/shell that is interactive **(-ti)** and we're binding **(-v)** our current folder **($PWD)** to a folder inside the docker **/output**. Now files in our current directly will be accessible to the docker and files the docker creates in that directory will be accessible to us. We also want the docker to delete itself when the job is complete **(--rm)**. We're passing an argument **(gnome.yaml)** to the command at the **ENTRYPOINT** command of the docker. So Effectively the docker is running the command ```/usr/bin/luet-makeiso gnome.yaml``` and that ```gnome.yaml``` file is accessible because its in the **WORKDIR** /output that we binded to the docker.

Now the docker will begin as a minimal image installing all required files via luet to have a bootable mocaccino gnome system. This will take some time. After all the packages are installed into the docker it will begin building an ISO of the current snapshot of that docker. After the ISO build is complete, the ISO will be dumped into /output which also happens to be the current directory your in on the host system ```~/Docker/iso-builder#```. After that is complete, the docker will proceed to remove itself. This cleans up any unncessary dockers and bloat on your system, but leaves you with the ISO in your iso-builder directory.
