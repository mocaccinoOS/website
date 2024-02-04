---
title: "Luet commands"
linkTitle: "Luet commands"
weight: 3
date: 2019-12-14
description: >
  Frequent commands
---

MocaccinoOS uses **luet** as a package manager. Here in this document are collected references from the luet docs.

## Installing a package

To install a package with `luet`, simply run:

```bash

$ luet install <package_name>

```
Be sure you write the full package name that includes the category. 
So if you are installing for example `neofetch`:

```bash

$ luet install apps/neofetch

```

## Uninstalling a package

To uninstall a package with `luet`, simply run:

```bash

$ luet uninstall <package_name>

```

## Upgrading the system

To upgrade your system, simply run:

```bash

$ luet upgrade

```

## Searching a package

To search a package:

```bash

$ luet search <regex>

```

To search a package and display results in a table:

```bash

$ luet search --table <regex>

```

To look into the installed packages:

```bash

$ luet search --installed <regex>

```

Note: the regex argument is optional


### Search output

Search can return results in the terminal in different ways: as terminal output, as json or as yaml.

#### JSON

```bash

$ luet search --json <regex>

```

#### YAML

```bash

$ luet search --yaml <regex>

```

#### Tabular


```bash

$ luet search --table <regex>

```

## References

- [Luet docs](https://luet.io/docs/concepts/overview/usage/)
