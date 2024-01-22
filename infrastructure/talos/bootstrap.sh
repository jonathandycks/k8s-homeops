#!/usr/bin/env bash

echo "Applying Node Configs"
# Deploy the configuration to the nodes
talosctl apply-config --insecure -n 10.0.0.11 -f ./clusterconfig/k8s-001-talos-001.internal.dyckshaus.dev.yaml
talosctl apply-config --insecure -n 10.0.0.12 -f ./clusterconfig/k8s-001-talos-002.internal.dyckshaus.dev.yaml
talosctl apply-config --insecure -n 10.0.0.13 -f ./clusterconfig/k8s-001-talos-003.internal.dyckshaus.dev.yaml

echo "Sleeping..."
sleep 120

talosctl config node "10.0.0.11"; talosctl config endpoint 10.0.0.11 10.0.0.12 10.0.0.13
echo "Running bootstrap..."
talosctl bootstrap

echo "Sleeping..."
sleep 180

talosctl kubeconfig -f .
export KUBECONFIG=$(pwd)/kubeconfig

echo kubectl get nodes
kubectl get nodes

./deploy-integrations.sh
