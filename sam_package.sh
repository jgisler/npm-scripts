#! /usr/bin/env bash
set -e

if [ -z ${1} ];
then
    echo "Usage: sam_package.sh {templateName}";
    exit 1;
else
    templatePath=$1 && \
    source .env && \
    sam package \
        --template-file ${templatePath} \
        --output-template-file ${templatePath}.out \
        --s3-bucket ${DeploymentBucket} \
        --s3-prefix ${DeploymentPrefix} \
        --region ${Region} \
        --profile ${Profile}
fi
