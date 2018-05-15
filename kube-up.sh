#!/bin/bash

set -ex

kubectl delete all,ing --all

kubectl run vets-service --expose --port=80 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-vets-service --image-pull-policy=Always
kubectl run visits-service --expose --port=80 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-visits-service --image-pull-policy=Always
kubectl run customers-service --expose --port=80 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-customers-service  --image-pull-policy=Always

kubectl run api-gateway --port=80 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-api-gateway --image-pull-policy=Always
kubectl expose deploy api-gateway --type=LoadBalancer
