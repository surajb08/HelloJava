#!/usr/bin/env bash


gcr_url="gcr.io/gcptraining-17042017/hello-java"
version=${1:-"latest"}

# Creates source-context.json file in target directory
gcloud debug source gen-repo-info-file --output-directory="target/classes/"

# Build maven package as specified in pom.xml
./mvnw -DskipTests package

# Complete image with version
image=$gcr_url:$version

# Docker build image with above tag
docker build -t $image .

# Push the built docker image to GCR
gcloud docker -- push $image

# Changes the image of the current deployment with new image
kubectl set image deployment/hello-world-py hello-world-py=$image -n demo --record