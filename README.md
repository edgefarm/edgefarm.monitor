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
    <img src="https://github.com/edgefarm/edgefarm/raw/main/.images/EdgefarmLogoWithText.png" alt="Logo" height="112">
  </a>

  <h2 align="center">edgefarm.monitor</h2>

  <p align="center">
    Monitoring your edge nodes and workload made easy.
  </p>
  <hr />
</p>

# About The Project

Using `EdgeFarm.monitor` there is a easy way of monitoring everything you need. Let it be edge node hardware metrics or accessing logs of your applications. 

`EdgeFarm.monitor` uses different open source tools like Grafana, Grafana Mimir, Node Exporter to provide monitoring of edge nodes and monitoring of application running on them.

## Features

- Monitor metrics of your edge nodes (CPU, load, memory, disk I/O, thermal information, network I/O)
- Managing alerts
- Metrics even are collected during times of unreliable network connections

<!-- GETTING STARTED -->

# Getting Started

Follow those simple steps, to install edgefarm.monitor in your cluster.

## ✔️ Prerequisites

- [(local) cluster running edgefarm](https://github.com/edgefarm/edgefarm)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [helm](https://helm.sh/)

## 🎯 Installation

Use helm3 to install the EdgeFarm.monitor chart.

```bash
helm upgrade --install --create-namespace -n edgefarm-monitor edgefarm-monitor oci://ghcr.io/edgefarm/edgefarm.monitor/edgefarm-monitor --version "1.0.0-beta.14"
```

See `charts/edgefarm-monitor/values.yaml` for options to configure the chart.

If you need information on how to use helm with OCI-based registries, please refer to the [helm documentation](https://helm.sh/docs/topics/registries/#using-an-oci-based-registry).

# 💡 Usage

Make sure that your nodepools corresponding to your edge nodes have the labels `monitor.edgefarm.io/metrics: default` set to enable monitoring for them.

```bash
kubectl label nodepools.apps.openyurt.io <name> monitor.edgefarm.io/metrics=default
```


If you deplyed this to the local EdgeFarm cluster, go to the Grafana UI ([https://grafana.localhost](https://grafana.localhost)) and login with the default credentials `admin`/`edgefarm`.

![edge nodes dashboard](.images/dashboard.png)

# 🤝🏽 Contributing

Code contributions are very much **welcome**.

1. Fork the Project
2. Create your Branch (`git checkout -b AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature")
4. Push to the Branch (`git push origin AmazingFeature`)
5. Open a Pull Request targetting the `beta` branch.

# 🫶 Acknowledgements

Thanks to the great open source projects Grafana, Grafana Mimir and Node Exporter stack!