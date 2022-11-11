#!/bin/bash
# set -o xtrace # uncomment it if you want deeper output
set -o errexit
set -o pipefail
nodes=$(kubectl get nodes --selector=node-role.kubernetes.io/agent | awk '(NR>1)' | awk  '{print $1;}')
IFS=$'\r\n'
array=($nodes)
array=("${array[@]/#/  - name: }")
touch node.yaml

yq 'del(.targetNodeGroups.[])' -i ./charts/node-exporter/values.yaml 
yq 'del(.targetNodeGroups.[])' -i ./charts/cadviser/values.yaml
yq 'del(.targetNodeGroups.[])' -i ./charts/grafana-agent/values.yaml

for str in ${array[@]}; do
  echo $str >> node.yaml
done

sed -i -e 's/.*targetNodeGroups:.*/targetNodeGroups:/' ./charts/node-exporter/values.yaml ./charts/cadviser/values.yaml ./charts/grafana-agent/values.yaml
sed -i -e '/targetNodeGroups:/r node.yaml' ./charts/node-exporter/values.yaml ./charts/cadviser/values.yaml ./charts/grafana-agent/values.yaml
rm -f node.yaml