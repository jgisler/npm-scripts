#! /usr/bin/env bash
set -ex

if [ -z ${1} ];
then
    echo "Usage: zip_layer.sh {templateName}";
    exit 1;
else
    ZIP_FILE=dist.zip
    source .env && \
    npx rimraf ${ZIP_FILE} && \
    (cd nodejs && npm prune --production && npm dedupe) && \
    zip -r dist.zip nodejs/ -x node_modules/.bin/ node_modules/.cache/
fi
