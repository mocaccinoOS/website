---
title: "Whalebrew"
linkTitle: "Whalebrew"
weight: 3
description: >-
     Whalebrew on Mocaccino Desktop
---
"[Whalebrew](https://github.com/whalebrew/whalebrew) is homebrew but for docker images" that is to say it creates aliases for docker images so you could run them as regular commands

## Setup

Be sure to have [docker](/docs/desktop/software/docker) installed, and the daemon running.

First install `utils/whalebrew`:

```bash
$ luet install utils/whalebrew
```

Now you should be able to use whalebrew as usual

## Install a package

```bash
$ whalebrew install whalebrew/ffmpeg
```

Then it should be accessible as a normal binary. You can call directly the program (`ffmpeg` in the above example)
