#!/bin/sh

set -ex

echo "-> Authenticating with GCloud"
echo "${GCP_CREDS}" | gcloud auth activate-service-account --key-file -
gcp_project_name=$(echo "$GCP_CREDS" | jq -r '.project_id')

export IMAGE=eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}
export VERSION=${CIRCLE_SHA1:latest}

gcloud config set project "${gcp_project_name}"

echo -e "\\n---Creating resources for ${CLUSTER_NAME}---"

gcloud container clusters get-credentials "${CLUSTER_NAME}" --region "${CLUSTER_REGION}"

cat k8s/*.yaml | envsubst | kubectl apply -f -