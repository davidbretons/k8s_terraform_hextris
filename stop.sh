#!/usr/bin/env sh

set -e

terraform destroy -var-file ./global-variables.tfvars -auto-approve

printf "\nCluster destroyed.. \n"
