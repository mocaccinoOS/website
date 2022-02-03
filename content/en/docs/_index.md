
---
title: "Documentation"
linkTitle: "Documentation"
weight: 20
menu:
  main:
    weight: 20
---

{{< alert color="warning" title="Warning" >}}
MocaccinoOS and this wiki is a work in progress. Please help us improve by opening a PR or filing an issue.

Mocaccino and Luet are under active development and should not be considered "production ready" at this time. The steps described in the article are for development only and should only be carried out on test systems.
{{< /alert >}}

Welcome to the MocaccinoOS wiki!

MocaccinoOS is a minimal meta-Linux distribution. It uses [Luet](https://luet-lab.github.io/docs) as a package manager, which is static and uses containers to build packages.

Main features of MocaccinoOS:

- Focused on minimalism, small footprint, and ease of use
- Native vanilla upstream kernel: We closely follow kernel versions from upstream, LTS included.
- Unique approach to package management: SAT-solving is also applied on packages built in containers (Docker, Kubernetes, etc.)
- Meta distribution: It can be easily used to bootstrap other OS or spin-offs
- Local iteration: With the container ecosystem, it's easy to iterate development locally
- Cloud first: Support for the most important cloud technology in the landscape
- Different variants: From server to desktop, from systemd to runit!

Here you will find installations, articles, and how-tos for the MocaccinoOS variants.
