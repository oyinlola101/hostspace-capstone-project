# hostspace-capstone-project
A repo that holds a ci-cd pipeline, monitoring , observality, infrastucture as code, git ops and ingress

This is a command to authenticate to the cluster, it parses the terraform outputs by substitution.
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)

if you need to acees your services via nodeport
gcloud compute firewall-rules create allow-nodeport \
    --allow tcp:30000-32767 \
    --target-tags gke-node

kubectl get secret --namespace monitoring loki-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
use namespace monitoring for any monitoring app
use namespace app for the app
use namespace secret for sealed secrets
use namespace cert-manager for cert mananger
use namespace ingress for ingress controller
