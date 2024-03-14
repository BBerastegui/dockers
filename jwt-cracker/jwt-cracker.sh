#!/bin/sh

echo "[i] Running jwt-cracker with a dictionary first..."
echo "$@"

if jwt-cracker -d jwt.secrets.list "$@"; then
    echo "[!] It worked! Exiting..."
else
    echo "[i] Secret wasn't found in the dictionary. Trying bruteforce now..."
    jwt-cracker "$@"
fi
