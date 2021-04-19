---
title: "Whalebrew"
linkTitle: "Whalebrew"
weight: 5
description: >-
     Whalebrew on Mocaccino Desktop
---

# Setup

Be sure to have [docker](/docs/desktop/docker) installed, and the daemon running.

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
