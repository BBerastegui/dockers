#!/bin/bash

for image in *
do
    if [ -d "${image}" ]; then
      echo "[i] Rebuilding bberastegui/${image} ..."
      docker build --no-cache ./${image} 
      docker push bberastegui/${image}
    fi
done
