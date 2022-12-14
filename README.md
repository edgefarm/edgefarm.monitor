[contributors-shield]: https://img.shields.io/github/contributors/edgefarm/edgefarm.monitor.svg?style=for-the-badge
[contributors-url]: https://github.com/edgefarm/edgefarm.monitor/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/edgefarm/edgefarm.monitor.svg?style=for-the-badge
[forks-url]: https://github.com/edgefarm/edgefarm.monitor/network/members
[stars-shield]: https://img.shields.io/github/stars/edgefarm/edgefarm.monitor.svg?style=for-the-badge
[stars-url]: https://github.com/edgefarm/edgefarm.monitor/stargazers
[issues-shield]: https://img.shields.io/github/issues/edgefarm/edgefarm.monitor.svg?style=for-the-badge
[issues-url]: https://github.com/edgefarm/edgefarm.monitor/issues
[license-shield]: https://img.shields.io/github/license/edgefarm/edgefarm.monitor?logo=mit&style=for-the-badge
[license-url]: https://opensource.org/licenses/AGPL-3.0

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![AGPL 3.0 License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/edgefarm/edgefarm.monitor">
    <img src="https://github.com/edgefarm/edgefarm.monitor/raw/main/.images/EdgefarmLogoWithText.png" alt="Logo" height="112">
  </a>

  <h2 align="center">edgefarm.monitor</h2>

  <p align="center">
    TODO: edgefarm.monitor description text🤑 🚀
  </p>
  <hr />
</p>

# About The Project

`edgefarm.monitoring` uses different open source tools to provide monitoring of edge nodes, default k8s nodes and monitoring of application on them.

## Features

- monitoring for k8s nodes and applicatons on them
- monitoring for edge nodes and applicatons on them

![Product Name Screen Shot][product-screenshot]

<!-- GETTING STARTED -->

# Getting Started

Follow those simple steps, to install edgefarm.monitor in your cluster.

## ✔️ Prerequisites

- [edgefarm.core](https://github.com/edgefarm/edgefarm.core)
- [devspace](https://devspace.sh/)
- [kind](https://kind.sigs.k8s.io)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [kustomize](https://kustomize.io/)
- [helm](https://helm.sh/)
- [mkcert](https://github.com/FiloSottile/mkcert)
- [jq](https://stedolan.github.io/jq/)

## 💡 [Do not skip] Mandatory step

TODO, maybe eliiminate this section

## 🎯 Installation

To init and deploy monitoring, execute the following commands.
The installation takes about 3 minutes.

Have a look at the `help` command to get an overview of all available commands.

```console
$ devspace run help
 General monitoring commands:
  devspace run init                                 Create password for monitoring and store it locally
  devspace run deploy-monitoring                    Creates full setup of monitoring
  devspace run-pipeline purge-monitoring            Remove monitoring setup
```

And spin up the monitoring:

```console
devspace run init
devspace run deploy-monitoring
```

Once done, you'll find the following pods running:

```console
$ kubectl get pods -n monitoring
NAMESPACE            NAME                                            READY   STATUS              RESTARTS   AGE
grafana-74796596fd-sxmzn                           1/1     Running     0          79s
grafana-agent-operator-5f657cdf4-82z5x             1/1     Running     0          39s
grafana-mimir-alertmanager-0                       1/1     Running     0          74s
grafana-mimir-compactor-0                          0/1     Running     0          74s
grafana-mimir-distributor-689cdd7965-7hp7g         1/1     Running     0          74s
grafana-mimir-ingester-0                           0/1     Running     0          74s
grafana-mimir-ingester-1                           0/1     Running     0          74s
grafana-mimir-ingester-2                           0/1     Running     0          74s
grafana-mimir-make-minio-buckets--1-g5wwf          0/1     Completed   0          74s
grafana-mimir-minio-67599d86b-ptc99                1/1     Running     0          74s
grafana-mimir-nginx-57db45f4c5-ltj89               1/1     Running     0          74s
grafana-mimir-overrides-exporter-7c89b68f5-kkpcm   1/1     Running     0          74s
grafana-mimir-querier-c4f8875f8-cflhs              1/1     Running     0          74s
grafana-mimir-querier-c4f8875f8-hqvcz              1/1     Running     0          74s
grafana-mimir-query-frontend-75b98c69c5-hnpz2      1/1     Running     0          74s
grafana-mimir-query-scheduler-6c484c5bfb-hw9xg     1/1     Running     0          74s
grafana-mimir-query-scheduler-6c484c5bfb-x6q24     1/1     Running     0          74s
grafana-mimir-ruler-7c789cbc4d-pcghw               1/1     Running     0          74s
grafana-mimir-store-gateway-0                      0/1     Running     0          74s
main-nats-monitoring-0                             2/2     Running     0          36s
```

```console
$ kubectl get pods -n loki
NAMESPACE            NAME                                            READY   STATUS              RESTARTS   AGE
loki-loki-distributed-compactor-5f76749b97-z9dz8        1/1     Running   0          79s
loki-loki-distributed-distributor-66c884fcd7-6rtgv      1/1     Running   0          79s
loki-loki-distributed-distributor-66c884fcd7-xhrz2      1/1     Running   0          79s
loki-loki-distributed-gateway-85f85b8675-h4ljb          1/1     Running   0          79s
loki-loki-distributed-ingester-0                        1/1     Running   0          79s
loki-loki-distributed-ingester-1                        1/1     Running   0          79s
loki-loki-distributed-querier-0                         1/1     Running   0          79s
loki-loki-distributed-querier-1                         1/1     Running   0          79s
loki-loki-distributed-query-frontend-66b88985cc-sktxb   1/1     Running   0          79s
loki-loki-distributed-table-manager-576c8cb5f6-kgwmz    1/1     Running   0          79s
promtail-hrnrx                                          1/1     Running   0          80s
promtail-xvnf5                                          1/1     Running   0          80s
```
After this you can access http://grafana.localhost/login to see metrics and logs.
By default:
User is admin
Password you can find in:
- File which was create by this command
```console
devspace run init
```
$HOME/.devspace/edgefarn.monitor/monitoring_password/

- Grafana secret
```console
kubectl get secrets -n monitoring grafana -o jsonpath="{.data.admin-password}" | base64 -d | xargs echo
```

# Usage

To uninstall monitoring setup run:
```console
devspace run-pipeline purge-monitoring
```

# Examples

TODO

# Debugging

TODO

# History

TODO

# Contributing

TODO


Code contributions are very much **welcome**.

1. Fork the Project
2. Create your Branch (`git checkout -b AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature")
4. Push to the Branch (`git push origin AmazingFeature`)
5. Open a Pull Request targetting the `beta` branch.

# 🫶 Acknowledgements

TODO
