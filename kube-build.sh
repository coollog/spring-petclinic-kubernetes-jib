#!/bin/bash

set -ex

(cd spring-petclinic-vets-service; mvn compile jib:build)
(cd spring-petclinic-visits-service; mvn compile jib:build)
(cd spring-petclinic-customers-service; mvn compile jib:build)
(cd spring-petclinic-api-gateway; mvn compile jib:build)
