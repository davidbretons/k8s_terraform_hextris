#!/usr/bin/env sh

set -e

terraform apply -var-file .\global-variables.tfvars -auto-approve
sleep 10
printf "\nWaiting for the service to start... \n"
kubectl apply -f chart.yaml
sleep 10