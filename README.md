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
    Monitoring your edge nodes and workload made easy.
  </p>
  <hr />
</p>

# About The Project

Using `EdgeFarm.monitor` there is a easy way of monitoring everything you need. Let it be edge node hardware metrics or accessing logs of your applications. 

`EdgeFarm.monitor` uses different open source tools like Grafana, Grafana Mimir, Node Exporter, Cadvisor, the Loki stack, to provide monitoring of edge nodes and monitoring of application running on them.

## Features

- Monitor metrics of your edge nodes (CPU, load, memory, disk I/O, thermal information, network I/O)
- Monitor applications you deployed
- Accessing logs of your applications
- Managing alerts
- Metrics even are collected during times of unreliable network connections

<!-- GETTING STARTED -->

# Getting Started

Follow those simple steps, to install edgefarm.monitor in your cluster.

## ✔️ Prerequisites

- [(local) cluster running edgefarm.core](https://github.com/edgefarm/edgefarm.core)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [devspace](https://devspace.sh/)
- [kustomize](https://kustomize.io/)
- [helm](https://helm.sh/)

## 🎯 Installation

To init and deploy monitoring, execute the following commands.
The installation takes several minutes. The deployment is split up in two sub-targets: core and backend clusters.


Have a look at the `help` command to get an overview of all available commands.

```console
$ devspace run help
Usage of edgefarm.monitoring:
 General monitoring commands:
  devspace run-pipeline init                          # Create password for monitoring and store it locally
  devspace run-pipeline deploy-core                   # Deploy all monitoring components to core cluster
  devspace run-pipeline purge-core                    # Remove all monitoring components from core cluster
  devspace run-pipeline deploy-backend                # Deploy all monitoring components to backend cluster
  devspace run-pipeline purge-backend                 # Remove all monitoring components from backend cluster
 Sub-Targets for core cluster:
  devspace run-pipeline deploy-grafana-agent          # Deploy grafana-agent to edge nodes
  devspace run-pipeline purge-grafana-agent           # Remove grafana-agent from edge nodes
  devspace run-pipeline deploy-node-exporter          # Deploy node exporter to edge nodes
  devspace run-pipeline purge-node-exporter           # Remove node exporter from edge nodes
 Sub-Targets for backend cluster (metrics):
  devspace run-pipeline deploy-prometheus-crd         # Deploy prometheus-crd to backend cluster
  devspace run-pipeline purge-prometheus-crd          # Remove prometheus-crd from backend cluster
  devspace run-pipeline deploy-grafana-mimir          # Deploy grafana-mimir to backend cluster
  devspace run-pipeline purge-grafana-mimir           # Remove grafana-mimir from backend cluster
  devspace run-pipeline deploy-grafana                # Deploy grafana to backend cluster
  devspace run-pipeline purge-grafana                 # Remove grafana from backend cluster
```

Make sure that you can access both clusters, core and backend.

```console
$ devspace run init
# Run this in the kubectl context of your core cluster
$ devspace run deploy-core
# Run this in the kubectl context of your backend cluster
$ devspace run deploy-backend
```

Obtain the grafana password and access grafana:

```console
# Run these commands in the kubectl context of your backend cluster
$ kubectl get secrets -n monitoring grafana -o jsonpath="{.data.admin-password}" | base64 -d | xargs echo
Vi5l0enzqQC3VLhiGYZzxPvz54O6nNJ*******WmM
$ kubectl port-forward svc/grafana 8080:80
```
After this you can access http://localhost:8080/login to see metrics and logs. The default user is `admin`.

# 💡 Usage

To uninstall monitoring setup run:
```console
# run this from your kubectl context for the core cluster
devspace run-pipeline purge-core
# run this from your kubectl context for the backend cluster
devspace run-pipeline purge-backend
```

# 🤝🏽 Contributing

Code contributions are very much **welcome**.

1. Fork the Project
2. Create your Branch (`git checkout -b AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature")
4. Push to the Branch (`git push origin AmazingFeature`)
5. Open a Pull Request targetting the `beta` branch.

# 🫶 Acknowledgements

Thanks to the great open source projects Grafana, Grafana Mimir, Node Exporter, Cadvisor and the Loki stack!