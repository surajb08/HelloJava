#!/usr/bin/env bash


gcr_url="gcr.io/gcptraining-17042017/hello-java"
version=${1:-"0.0.1"}

image=$gcr_url:$version

docker build -t $image .

gcloud docker -- push $image

kubectl set image deployment/hello-world-py hello-world-py=$image -n demo --record