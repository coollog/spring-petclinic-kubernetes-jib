#!/usr/bin/bash

set -ex

kubectl run vets-service --expose --port=8080 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-vets-service
kubectl run visits-service --expose --port=8080 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-visits-service
kubectl run customers-service --expose --port=8080 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-customers-service
kubectl run api-gateway --expose --port=8080 --image=gcr.io/qingyangc-sandbox/spring-petclinic:spring-petclinic-api-gateway

kubectl expose service api-gateway --type=LoadBalancer --name=frontend
