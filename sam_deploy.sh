#! /usr/bin/env bash
set -e

if [ -z ${1} ];
then
    echo "Usage: sam_deploy.sh {templateName}";
    exit 1;
else
    templateName=$1 && \
    source .env && \
    sam deploy \
        --stack-name ${StackName} \
        --no-fail-on-empty-changeset \
        --s3-bucket ${DeploymentBucket} \
        --s3-prefix ${DeploymentPrefix} \
        --parameter-overrides ${CloudFormationParams} \
        --tags ${TagParams} \
        --region ${Region} \
        --profile ${Profile} \
        --capabilities CAPABILITY_NAMED_IAM && \
    npm install && \
    date
fi
