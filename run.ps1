terraform apply -auto-approve
Start-Sleep 10
Write-Output "Waiting for the echo web server service..."
kubectl delete ValidatingWebhookCOnfiguration ingress-nginx-admission
kubectl apply -f chart.yaml
Start-Sleep 10