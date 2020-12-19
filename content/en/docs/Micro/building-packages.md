---
title: "Building packages with Micro and k3s"
linkTitle: "Building packages with Micro and k3s"
weight: 4
description: >-
     How to build packages with Luet in Mocaccino Micro and k3s
---

{{< alert color="warning" title="Warning" >}}
This is currently experimental

{{< /alert >}}

In `Micro`, currently it's possible to build packages with [K3s](https://k3s.io) and [Luet](https://github.com/mudler/luet-k8s)

First install k3s:

```bash
luet install -y container/k3s runit-srv/k3s
```

And start it:

```bash
$ runit-start k3s
```

To enable it permanently on boot, run ```runit-enable k3s```


Wait for k3s to be ready (Until `ContainerCreating` becomes `Ready`):

```bash
$ watch k3s kubectl get pods -A
```

Now install the [luet controller](https://github.com/mudler/luet-k8s):

```bash
$ k3s kubectl apply -f https://raw.githubusercontent.com/mudler/luet-k8s/master/hack/kube.yaml
```

And wait for it to be ready:

```bash
$ watch k3s kubectl get pods -A
```

Once all is up, we are ready to build packages, try for example with:

```bash
$ cat <<EOF | k3s kubectl apply -f -
apiVersion: luet.k8s.io/v1alpha1
kind: PackageBuild
metadata:
  name: test
spec:
  packageName: container/img
  repository: 
    url: "https://github.com/mocaccinoOS/mocaccino-extra"
  options:
    pull: true
    imageRepository: "quay.io/mocaccinocache/extra-amd64-cache"
EOF
```

In this case, we can inspect the build logs with:

```bash
k3s kubectl logs -f test
```

## Example

- [Full package build example](https://github.com/mudler/luet-k8s#full-example)
