#!/bin/bash

if [ $(cat ~/.docker/config.json | jq -r '.auths') = "{}" ]
then
    echo "[i] Login to a docker repo first.";
    exit 1;
fi

for image in *
do
    if [ -d "${image}" ]; then
      echo "[i] Rebuilding bberastegui/${image} ..."
      docker build --no-cache -t bberastegui/${image} ./${image}
      docker push bberastegui/${image}
    fi
done
