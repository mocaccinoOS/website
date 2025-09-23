---
title: "Luet Package manager"
linkTitle: "Luet Package manager"
weight: 3
date: 2019-12-14
description: >
  Frequent commands
---

MocaccinoOS uses **luet** as a package manager. Here in this document are collected references from the luet docs.

{{< alert color="primary" title="Note" >}}
Luet does not recognize packages installed on top of its layers (e.g., by Flatpak) and functions as an immutable system, meaning its core components remain unchanged.
{{< /alert >}}

## Update the repositories

This command updates your repository database.

```bash

$ sudo luet repo update

```

## Installing a package

To install a package with `luet`, simply run:

```bash

$ sudo luet install <package_name>

```
Be sure you write the full package name that includes the category. 
So if you are installing for example `neofetch`:

```bash

$ sudo luet install apps/neofetch

```

## Uninstalling a package

To uninstall a package with `luet`, simply run:

```bash

$ sudo luet uninstall <package_name>

```

## Upgrading the system

To upgrade your system, simply run:

```bash

$ sudo luet upgrade

```

## Searching a package

To search a package:

```bash

$ sudo luet search <regex>

```

To search a package and display results in a table:

```bash

$ sudo luet search --table <regex>

```

To look into the installed packages:

```bash

$ sudo luet search --installed <regex>

```

Note: the regex argument is optional


### Search output

Search can return results in the terminal in different ways: as terminal output, as json or as yaml.

#### JSON

```bash

$ sudo luet search --json <regex>

```

#### YAML

```bash

$ sudo luet search --yaml <regex>

```

#### Tabular


```bash

$ sudo luet search --table <regex>

```

#### GUI tool

{{< alert color="primary" title="Note" >}}
The Luet gui tool is still under development but considered stable.
{{< /alert >}}

If you prefer a graphical tool to perform simple tasks you can consider installing apps/luet_pm_gui

```bash

$ sudo luet install apps/luet_pm_gui

```

## References

- [Luet docs](https://luet.io/docs/concepts/overview/usage/)
