---
title: "Frequent questions"
linkTitle: "Frequent questions"
weight: 20
description: >-
     How do I..? ~~hitchhiker's~~ Ops guide to the galaxy.  This document tries to collect the frequent questions while operating the MocaccinoOS tree
---

This document has the objective to address several questions that starts with "How do I ... ?"

## How do I start contributing?

Have a look at the official [Luet docs](https://luet-lab.github.io/docs/docs/concepts/overview/build_packages/) about package building, and feel free to submit your first PR! Be sure to also read all this document to get an Idea on how things should look like.

## How do I know which version of a package is available in the Portage tree

We pin Portage versions by using packages that are shipping a version of it.
This guarantees that there are no moving parts, and we can in this way provide updates as part of a development lifecycle.

We have an automated bot that automatically opens PR to track new version of the available Portage version. The package is available here: https://github.com/mocaccinoOS/desktop/tree/master/packages/portage. You don't need to do it manually. Just wait for a PR from `MarvinHatesOceans` to pop-up, we will review it and merge it only when we decide (after proper QA) that a development lifecycle is over.

A Portage bump happens when:

- We close a dev cycle (release, and upgrades)
- Security fixes

### So, how do I know which package I can build?

At the moment is as easy as browsing the portage git and point it at the same commit of our package. 

For example:

`git.hash: "b0e157b071cb23b348acab3d596b49f66c244808"` in https://github.com/mocaccinoOS/desktop/blob/e9ae4aafead5a79d1d36630c932d907361d8c93c/packages/portage/definition.yaml#L6 tells you that we are pinning at commit `b0e157b071cb23b348acab3d596b49f66c244808` of portage tree. So you can e.g. point your browser at : https://github.com/gentoo/gentoo/tree/b0e157b071cb23b348acab3d596b49f66c244808

## How do I revbump a package? (and when it's actually needed?)

By convention, we have chosen to increment the version of a package after the `+`, following [semver](https://semver.org/) notation.

That means, if a package version is at `1.0.0`, it's revbump version would be `1.0.0+1`, and a subsequent one would be for example `1.0.0+2`.

### When I do need to bump a package?

Only when there is a new version available!

### When I do need to revbump a package?

A Package revbump is necessary when you apply changes to `build.yaml`, although, it's not always necessary, but just in few cases:

- When you change `steps` in the `build.yaml`
- When you change `prelude` in the `build.yaml`
- When you change `requires` in the `build.yaml`

### What about packages depending on it?

Always by convention, we have chosen to revbump __manually__ those. Luet does support tracking automatically new package versions, but we want to make this transparent in the Git repository, so reverting changes introduced by mistakes it's easier, and so we also rely on the caching mechanism of Luet.

If we don't revbump reverse dependencies our CI would skip such changes, because we enforced this by policy.

### How do I do that?

Until https://github.com/mocaccinoOS/desktop/issues/7 is delivered, it is a manual process.

## How do I add a useflag to a Portage package or layer?

If the useflag you are going to add doesn't have an huge impact on its dependencies (not requiring a rebuild) then it's fine to apply at the spec-level. 
Otherwise it might be required to specify the useflags needed in that specific package, or on the parent layer which your package is depending on, requiring a package revbump.

Take the [layers/system-x package](https://github.com/mocaccinoOS/desktop/tree/master/packages/layers/system-x) as an example, in the prelude steps of the package, we copy over the building container the custom useflags in the prelude steps:

```yaml
prelude:
- cp -rf package.use /etc/portage/
- cp -rf make.conf /etc/portage/
- cp -rf package.accept_keywords /etc/portage/
- cp -rf package.license /etc/portage/
```

the `package.use` folder is actually shipped with the [package spec](https://github.com/mocaccinoOS/desktop/tree/master/packages/layers/system-x/package.use). That approach can be used also in layers depending on `system-x`, with a separate set of flags. You just have to be sure to not override any useflag between layers, and to try to share as much as you can with parent layers while do you see it fit.

## How do I split a package?

A layer can be split into multiple packages, using the `excludes`/`includes` pattern which is used for example by `gcc` and `gcc-base`. This means you can safely compile packages into parent-layers, and exclude those in the final artifact which gets installed by the end-user.

For example, for `gcc` we drop the files from `system-x`, and we `include` explicitly files to the gcc package, which at that point doesn't need to compile anything by itself. It just needs to depend on the parent layer, so all the `gcc` files are accessible from that container.

In the system-x spec, you will find something similar:

```yaml
excludes:
...

# GCC split
- ^/etc/env.d/04gcc-x86_64-pc-linux-gnu
- ^/etc/ld.so.conf.d/05gcc-x86_64-pc-linux-gnu.conf
- ^/etc/env.d/gcc.*
- ^/usr/lib/debug/usr/lib/gcc.*
- ^/usr/lib/gcc/x86_64-pc-linux-gnu.*
- ^/usr/share/gcc-data/x86_64-pc-linux-gnu.*
- ^/usr/bin/c\+\+.*
- ^/usr/bin/cc$
- ^/usr/bin/cpp.*
```

This tells luet to exclude those files from the final artifact.

Similarly, you can find in the [gcc](https://github.com/mocaccinoOS/desktop/blob/master/packages/layers/system-x/gcc/build.yaml) package those files being included:

```yaml
includes:
...
- /usr/lib/gcc$
- /usr/lib/gcc/x86_64-pc-linux-gnu$
- /usr/lib/gcc/x86_64-pc-linux-gnu/{{.Values.version}}.*
- /usr/lib/go$
- /usr/lib/go/{{.Values.version}}.*
- /usr/lib64$
- /usr/lib64/go$
- /usr/lib64/go/{{.Values.version}}.*
- /usr/libexec$
- /usr/libexec/gcc$
- /usr/libexec/gcc/x86_64-pc-linux-gnu$
- /usr/libexec/gcc/x86_64-pc-linux-gnu/{{.Values.version}}.*
- /usr/share$
- /usr/share/gcc-data$
- /usr/share/gcc-data/x86_64-pc-linux-gnu$
- /usr/share/gcc-data/x86_64-pc-linux-gnu/{{.Values.version}}.*
```

## How do I try my changes?

You need at least Docker running locally, or img installed.

To build a package, just edit/add the relevant specs and run `PACKAGES=".." make rebuild-all`.

### How can I debug the build environment?

Luet generates docker images for each package, you can start a shell by either retrieving the docker image of the package manually with `luet tree images`  and manually run `docker run..` on it. Here an example how we shell into layers/X:

```bash
luet tree images --image-repository quay.io/mocaccino/desktop layers/X
```
This returns a list of docker containers where layers/X image is created from. 

```bash
layers/gentoo-portage-0.20230110: quay.io/mocaccino/desktop:febbfe7192e42abb3671acd65ff3ec7a6cfad063334f5c24301f30b56f0ad7dd
layers/system-x-0.20230110: quay.io/mocaccino/desktop:7343fcc6f4bbbf5906b3104ad96431192a0110fb020186825409abac6587ddc3
layers/codecs-7+22: quay.io/mocaccino/desktop:4e885e2b509102e808f21efa38f4734c98e23279775beb2b3a0ec6db182f7ebd
layers/sys-fs-0.9+27: quay.io/mocaccino/desktop:e1ae4a4e732e8a866721d380c7a30c930996d6d0e1840deaa5901d35f72a3b35
layers/X-1.1+28: quay.io/mocaccino/desktop:865b8d9662679f9c145f13b82c803f3380d7b5dbfad2fa2316646a46977ad3c2
```
Now that we know the image string we can apply that to our docker command:

```bash
docker run -ti --rm quay.io/mocaccino/desktop:865b8d9662679f9c145f13b82c803f3380d7b5dbfad2fa2316646a46977ad3c2 /bin/bash
```
Or you can use the luet extension which does that already for you. You need to have installed `system/luet-devkit` package, and you can use it as follows:

```bash
DOCKER_HOST="..." LUET_ARGS="--image-repository quay.io/mocaccino/desktop" luet remote-exec packagename
```

Note: It's not required `DOCKER_HOST` unless you want to leverage a remote host.

Once you are hooked into the container there are some limited tools at your disposal that might help you. For instance if you want to list all the atoms that are installed you can do:

```bash
qlist -IRv
```

## How do I add a package?

Have a look at the [official docs](https://luet-lab.github.io/docs/docs/concepts/packages/specfile/) about specfile and their syntax. After you familiarize with it, you can just open up a PR, by taking as an example an already existing layer. [See, for example calamares](https://github.com/mocaccinoOS/desktop/tree/master/packages/apps/calamares)

## How do I update provides list, and what are they?

Provides are packages that your layer/package is going to satisfy. That means if other packages are depending on a `package/foo`, and that is provided by `package/bar`, `package/bar` will get installed in place of `package/foo`.

At the moment it's a manual process - and we will work an automated way as soon as we have bandwidth for it. This mechanism it's used to ensure a smooth migration path from Sabayon/Entropy based systems.

## How do I know that a package belongs to a Layer?

Packages belonging to a layer should be listed as provides, and also part of the arguments to emerge for compiling that package. Until we deliver https://github.com/mocaccinoOS/desktop/issues/6 - it is also a manual process. Refer to the section of this document "How can I debug the build environment?" to see how to hook directly into a package container to inspect its content.

## How do I find the duplicate files in the package repositories?

You can use `luet search` and `luet filter` to compose a list of duplicate files.  `luet 0.11.3` returns the files in the packages as part of the json result:

```bash
luet search -o json | luet filter
```

To install `luet-filter`, just run:

```bash
luet install -y extension/filter
```

*Note*: `luet search` searches into online repositories enabled in the system unless `--installed` is specified. You need to have the desktop repo enabled locally in order to retrieve this list.

### Filter by package fields

As luet filter can be piped, you can use jq to narrow down the search by specific by package fields. For example, to filter out by category, you can:

```bash
$ luet search -o json | jq '{ packages: [.packages[] | select( .category == "kernel-modules" )] }' | luet filter
Duplicate found for etc/modprobe.d/vboxdrv.conf in kernel-modules/virtualbox-modules kernel-modules/virtualbox-modules-lts
Duplicate found for usr/lib/modules-load.d/virtualbox.conf in kernel-modules/virtualbox-modules kernel-modules/virtualbox-modules-lts
```

Note, the query is `select( .category == "kernel-modules" )` and you can customize it further to narrow down to specific queries.

#### Examples

##### Filtering kernel

```luet search -o json | jq '{ packages: [.packages[] | select( .category != "kernel" )] }' | luet filter >> dups.txt```


##### Filtering 'layers' and 'repository category

```luet search -o json | jq '{ packages: [.packages[] | select( .category != "repository" ) | select(.category != "layers") ] }' | luet filter >> dups.txt```


## The package I want to add needs a user/group. Where do I add it?

The user/groups in **MocaccinoOS** are defined by [entities](https://github.com/mudler/entities). They are an uniform way to define user/groups across different distributions in a unique and interoperable way. The same users/groups are indeed shared with Mocaccino Micro.

All the users groups are defined in a unique [collection](https://luet-lab.github.io/docs/docs/concepts/packages/collections/) inside the [os-commons](https://github.com/mocaccinoOS/os-commons) repository, [here](https://github.com/mocaccinoOS/os-commons/blob/master/packages/entities/collection.yaml)

## How do I add a system-wide extension, or configure a gnome setting?

We have a [gnome-skel](https://github.com/mocaccinoOS/desktop/tree/master/packages/mocaccino/gnome-skel) package for that purpose. Check the content, apply the required changes and bump the package version.
