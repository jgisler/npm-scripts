#! /usr/bin/env bash
set -e

if [ -z ${1} ];
then
    echo "Usage: sam_package.sh {templateName}";
    exit 1;
else
    templateName=$1 && \
    source .env && \
    sam package \
        --template-file sam/${templateName}.yaml \
        --output-template-file ${templateName}-out.yaml \
        --s3-bucket ${DeploymentBucket} \
        --s3-prefix ${DeploymentPrefix} \
        --force-upload \
        --region ${Region} \
        --profile ${Profile}
fi
