---
title: "Repositories"
linkTitle: "Repositories"
weight: 3
description: >-
     This document describes how to enable or switch between stable and unstable repositories
---
By default MocaccinoOS ships with the mocaccino-desktop-stable repository installed. This repository has all the core layers and [desktop environments](/docs/desktop/desktop_environments).

## Community repository

Any additional software that is compiled and packaged by the MocaccinoOS project is available in the community repository.
So if you for instance want to install neovim, alacritty or gimp, you first need to install the community repository.

```bash
$ sudo luet install repository/mocaccino-community-stable
```

The [community repository](https://github.com/mocaccinoOS/community-repository?tab=readme-ov-file#-community-repository) is maintained by the community and users can participate by requesting packages or even make a pull request to contribute.

## Using development repositories for testing

Development isos that have the `-dev` suffix have the development repositories pre-installed. The -dev ISOs
are intended for development and testing only, so this document outlines the steps to switch back and forth from the stable and unstable repositories.

## Identify the installed repositories

With `luet repo list` you can check the repositories currently installed in the system, for example:

```bash
$ sudo luet repo list       
mocaccino-repository-index
  MocaccinoOS Repository Index
  Revision 1 - 2021-01-02 17:47:32 +0100 CET
luet
  Luet official Repository
  Revision 1 - 2021-04-23 20:11:47 +0200 CEST
mocaccino-extra-stable
  MocaccinoOS extra Repository (stable)
  Revision 178 - 2021-04-23 18:35:14 +0200 CEST
mocaccino-extra
  MocaccinoOS extra Repository
  Revision 178 - 2021-04-23 18:35:14 +0200 CEST
mocaccino-repository-index
  MocaccinoOS Repository Index
  Revision 1 - 2021-01-02 17:47:32 +0100 CET
```

If the output doesn't contain repositories named with `-stable` at the end, most likely you are using the development repositories.

## Switch repositories

{{< alert color="warning" title="Warning" >}}
Do not mix development and stable repositories! Be sure to only have installed `stable` or the development repositories.
{{< /alert >}}

In MocaccinoOS repositories are standard packages. To remove the development repositories, you can:

```bash
$ luet uninstall -y repository/mocaccino-extra repository/mocaccino-desktop repository/mocaccino-os-commons
```

And then to enable the stable repositories:

```bash
$ luet install -y --nodeps repository/mocaccino-extra-stable repository/mocaccino-desktop-stable repository/mocaccino-os-commons-stable
```

The same procedure is valid as well to switch from `-stable` to development repositories. 

The difference is that you have to remove the `-stable` ones instead.

