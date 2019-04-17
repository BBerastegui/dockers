#!/bin/sh

if [ ! -f /tmp/certificate.pem ]; then
    >&2 echo "[ERROR] It's mandatory to provide a /tmp/certificate.pem"
    exit 0
else
    cat /tmp/certificate.pem | /bin/zcertificate | jq . > /tmp/certificate.json
fi
