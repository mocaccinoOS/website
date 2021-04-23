---
title: "System profiles"
linkTitle: "System profiles"
weight: 4 
description: >-
     Enabling and disabling system profiles
---

System profiles are specific `MocaccinoOS` configuration that can be enabled/disabled from the `mos` cli.

## List available profiles

To list all the **installed** available profiles, run `mos profile list`

## Enable profiles

To enable a specific profile, run `mos profile enable <profile>`

## Disable profiles

To disable a profile, run `mos profile disable <profile>`

## Search available profiles

To search all the available profiles for installation, run `luet search system-profiles`.

To install a specific profile, run `luet install system-profile/<name>`.