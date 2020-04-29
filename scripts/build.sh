#!/bin/sh

set -ex

echo ${GCP_CREDS} > ${HOME}/gcp-key.json

gcp_project_name=$(echo "$GCP_CREDS" | jq -r '.project_id')

docker build --rm=false -t eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}:$CIRCLE_SHA1 .

gcloud config set project "${gcp_project_name}"
gcloud auth activate-service-account --key-file ${HOME}/gcp-key.json
gcloud docker -- push eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}:$CIRCLE_SHA1