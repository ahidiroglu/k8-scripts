#!/bin/bash

#script to get output of all resources from kube-api

namespace=

for n in $(kubectl get -n $namespace -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,statefulset,hpa,job,cronjob)
do
    mkdir -p $(dirname $n)
    kubectl get -n $namespace -o=yaml $n > $n.yaml
done
