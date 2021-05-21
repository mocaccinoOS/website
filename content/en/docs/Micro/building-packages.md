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

## (advanced) Multi-node setup

This section shows how to configure 2(or more) MocaccinoOS Micro instances with [K3s](https://k3s.io) and [edgevpn](https://github.com/mudler/edgevpn).


{{< alert color="warning" title="Warning" >}}
Note, this setup is for development purposes, and intended to be run in a trusted environment, and just on Virtual machines. The following steps should only be carried out on test systems. Do make sure you have any important data backed up before starting a migration.
{{< /alert >}}

### Install edgevpn and k3s

```bash
luet install -y runit-srv/edgevpn utils/edgevpn container/k3s runit-srv/k3s
```

### Generate edgevpn configuration

```bash
edgevpn -g > vpn.yaml
```

Save the configuration file, it has to be available on all the machines that will belong to the cluster.

### Start the vpn

We are ready to try to start the vpn:

- on node A: `sudo IFACE=edgevpn0 ADDRESS=10.1.0.3/24 EDGEVPNCONFIG=vpn.yml edgevpn`

- on node B: `sudo IFACE=edgevpn0 ADDRESS=10.1.0.4/24 EDGEVPNCONFIG=vpm.yml edgevpn`


Where:

- `IFACE` is the vpn interface to be created
- `ADDRESS` is the address of the node in the vpn network
- `EDGEVPNCONFIG` is the path of the configuration which was generated before

If all goes well, we should see some connection messages, and after a while we should be able to ping the nodes.

### Start k3s:

- on node A: `k3s server --flannel-iface=edgevpn0`

- on node B: `K3S_URL=https://10.1.0.3:6443 K3S_TOKEN=xx k3s agent --flannel-iface=edgevpn0 --node-ip 10.1.0.4`

### Permanent setup

Annotate the `IFACE`, `ADDRESS`, and `EDGEVPNCONFIG` in `/etc/sv/edgevpn/conf` in each node, and then you can use the following yip file for example to configure k3s (to place under `/etc/yip.d`):

Node A:
```yaml
stages:
  boot:
       -  name: "k3s"
          commands:
          - |
              if [ ! -e "/usr/bin/k3s" ]; then
                luet install -y container/k3s runit-srv/k3s
                runit-enable k3s
              fi
          - ulimit -u unlimited
          files:
          - path: "/etc/sv/k3s/run"
            owner: 0
            group: 0
            permissions: 0755
            content: |
              #!/bin/sh

              exec 2>&1

              [ -r ./conf ] && . ./conf

              echo 'k3s starting.'

              LANG=C LC_ALL=C \
              exec /usr/bin/k3s server --flannel-iface=edgevpn0 2>&1
```

Node B:

```yaml
stages:
  boot:
       -  name: "k3s"
          commands:
          - |
              if [ ! -e "/usr/bin/k3s" ]; then
                luet install -y container/k3s runit-srv/k3s
                runit-enable k3s
              fi
          - ulimit -u unlimited
          files:
          - path: "/etc/sv/k3s/run"
            owner: 0
            group: 0
            permissions: 0755
            content: |
              #!/bin/sh

              exec 2>&1

              [ -r ./conf ] && . ./conf

              echo 'k3s starting.'

              LANG=C LC_ALL=C K3S_URL=https://10.1.0.1:6443 K3S_TOKEN=xxx \
              exec /usr/bin/k3s agent --flannel-iface=edgevpn0 --node-ip 10.1.0.13 2>&1

```

Then enable the services at boot:

```bash
$ runit-enable k3s
$ runit-enable edgevpn
```
## Example

- [Full package build example](https://github.com/mudler/luet-k8s#full-example)
