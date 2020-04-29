#!/bin/sh

set -ex

echo "-> Authenticating with GCloud"
cat <<EOF > ${HOME}/gcp-key.json
$GCP_CREDS
EOF
gcloud auth activate-service-account --key-file=${HOME}/gcp-key.json

gcp_project_name="jagendra-atal-prakash-contino"

export IMAGE=eu.gcr.io/${gcp_project_name}/${IMAGE_NAME}
export VERSION=${CIRCLE_SHA1:latest}

gcloud config set project "${gcp_project_name}"

echo -e "\\n---Creating resources for ${CLUSTER_NAME}---"

gcloud container clusters get-credentials "${CLUSTER_NAME}" --region "${CLUSTER_REGION}"

cat k8s/*.yaml | envsubst | kubectl apply -f -