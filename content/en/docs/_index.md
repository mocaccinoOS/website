
---
title: "Documentation"
linkTitle: "Documentation"
weight: 20
menu:
  main:
    weight: 20
---

{{< alert color="warning" title="Warning" >}}
MocaccinoOS and this wiki is a work in progress, please help us improve by opening a PR or filing an issue.

Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The steps described in the article are for development only and should only be carried out on test systems.
{{< /alert >}}

Welcome to the MocaccinoOS wiki!

MocaccinoOS is a minimal meta-Linux Distribution. It uses [Luet](https://luet-lab.github.io/docs) as Package Manager which is static and uses containers to build packages.

Main features of MocaccinoOS:

- Focused on minimalism, small foot print and ease of use
- Native Vanilla upstream kernel: We follow closely kernel versions from upstream, lts included.
- Unique approach to Package Management: SAT solving applied also on package build in containers (docker, Kubernetes, ... )
- Meta distribution: It can be easily used to bootstrap other OS or spin-offs
- Local iteration: With the container ecosystem, it's easy to iterate development locally
- Cloud first: support for the most important cloud technology in the landscape
- Different variants: from Server to Desktop, from systemd to runit!

Here you will find Installations, articles and how-tos for the MocaccinoOS variants
