# hostspace-capstone-project
A repo that holds a ci-cd pipeline, monitoring , observality, infrastucture as code, git ops and ingress

This is a command to authenticate to the cluster, it parses the terraform outputs by substitution.
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

if you need to acees your services via nodeport
gcloud compute firewall-rules create allow-nodeport \
    --allow tcp:30000-32767 \
    --allow udp:30000-32767 \
    --target-tags gke-node


use namespace monitoring for any monitoring app
use namespace app for the app
use namespace secret for sealed secrets
use namespace cert-manager for cert mananger
use namespace ingress for ingress controller

kubectl get secret --namespace monitoring my-loki-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

http://my-prometheus-server:80   the server url to input in grafana, loki data source is automatically added.

kubectl get secret argocd-initial-admin-secret --namespace argocd  -o jsonpath="{.data.password}" | base64 --decode ; echo
kubectl apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.19.4/controller.yaml(in case crds for sealed secets arent installed)



https://loom.com/share/folder/5b8072eb3bad4b079a5cb0bfb358c83e 
this link contains a demo.
