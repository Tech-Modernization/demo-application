#!/bin/sh

set -ex

gcp_project_name="jagendra-atal-prakash-contino"

docker build --rm=false -t eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}:$CIRCLE_SHA1 .

gcloud config set project "${gcp_project_name}"
gcloud auth activate-service-account --key-file ${GCP_CREDS}
gcloud docker -- push eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}:$CIRCLE_SHA1