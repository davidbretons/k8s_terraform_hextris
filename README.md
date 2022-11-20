
# Synopsis

This project is an example on how to deploy an app using Helm Charts in a Kubernetes Cluster (KinD) using ingress-nginx as a reverse proxy. We use Terraform to automate the deployment.

As a KinD cluster, this project uses a containerized version of the game using Apache httpd.

**Default sources for the content used in this project**

Hextris Game:\
https://github.com/Hextris/hextris

DockerHub, Hextris Image:\
https://hub.docker.com/r/davidbreton/hextris

# Results from execution

The creation of a local Kubernetes cluster that will allow you to access a service of Hextris over localhost. 

# Prerequisites

* terraform [Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)\
`terraform -version`
* kind [Installation](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)\
`kind --version`
* docker [Installation](https://docs.docker.com/get-docker/)\
`docker --version`
* helm [Installation](https://helm.sh/docs/intro/install/)\
`helm`
* kubectl [Installation](https://kubernetes.io/docs/tasks/tools/#kubectl)\
`kubectl`

# Procedure

Review `global-variables.tfvars` file if you want to modify any predefined value.

## Windows

Download the contents of this repository, open an Administrator Powershell window, change to the path where the files are saved and execute:\
`terraform init`\
This will download the required terraform providers.

Before executing the following script please be sure to have all [prerequisites](https://github.com/davidbretons/k8s_terraform_hextris#prerequisites) deployed on your machine.

A powershell script has been provided to facilitate the creation of the project. Conect on the Powershell script:

```
# run.ps1

terraform apply -var-file .\global-variables.tfvars -auto-approve

Start-Sleep 10
Write-Output "Waiting for the echo web server service..."
kubectl delete ValidatingWebhookCOnfiguration ingress-nginx-admission
kubectl apply -f chart.yaml
Start-Sleep 10

Write-Output "Execution Completed."
```

Execute: \
`.\run.ps1`

Wait for the execution to complete. This might take time depending on your machine and if its the first time you execute the script. Once completed the script you can verify the state of the cluster with the followin command:\

`kubectl get all -A`

Make sure all pods have a Running state to ensure the expected output.

Once you are sure the cluster was properly created and running, open a browser window and type:\

`http://localhost`

You should be able to see a new session of Hextris game. Have fun!

Once you are done playing, destroy the cluster by executing:\
`.\stop.ps1`

## Linux

Download the contents of this repository, open a terminal and change to the path where the files are saved and execute:\
`terraform init`\
This will download the required terraform providers.

Before executing the following script please be sure to have all [prerequisites](https://github.com/davidbretons/k8s_terraform_hextris#prerequisites) deployed on your machine.

A shell script has been provided to facilitate the creation of the project. Code on the shell script:

```
#!/usr/bin/env sh

set -e

terraform apply -var-file .\global-variables.tfvars -auto-approve
sleep 10
printf "\nWaiting for the service to start... \n"
kubectl apply -f chart.yaml
sleep 10
```

Execute: \
`chmod +x run.sh`
`./run.sh`

Wait for the execution to complete. This might take time depending on your machine and if its the first time you execute the script. Once completed the script you can verify the state of the cluster with the followin command:\

`kubectl get all -A`

Make sure all pods have a Running state to ensure the expected output.

Once you are sure the cluster was properly created and running, open a browser window and type:\

`http://localhost`

You should be able to see a new session of Hextris game. Have fun!

Once you are done playing, destroy the cluster by executing:\
`chmod +x stop.sh`
`stop.sh`

# Known problems and limitations

* It is recommended to open a new private window on your broser to prevent any previous execution to be cached.

# Examples

# Support

**Author Information**

David Breton - Solution Architect

## License
