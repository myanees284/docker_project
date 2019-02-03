#!/bin/bash
timestamp=$(date +%s)
imagever=myanees/aneesm:v$timestamp
APIKEY=${clogin}
KUBECONFIG=${kubeconfig}
DLOGIN=${dlogin}
DPASS=${dpass}
docker login --username $DLOGIN --password $DPASS
docker build -t $imagever .
docker push $imagever
ibmcloud login --apikey $APIKEY -r eu-de
ibmcloud ks cluster-config mycluster
export $KUBECONFIG
#export DEPNAME=$(kubectl get deployment -o json | jq '.items[0].metadata.name')
export DEPNAME=$(kubectl get deployment --selector=$sel --output=jsonpath={.items..metadata.name})
echo $DEPNAME
if [[ $DEPNAME == *"hellosample"* ]]
then
  echo "Updating container IMAGE"
  kubectl set image deployments/hellosample2 testla=$imagever
else
  echo "Creating DEPLOYMENdT"
  kubectl create -f Sample_Deployment.yml
  kubectl create -f exposeservice.yml
fi
