#!/bin/bash

# GITHUB_TOKEN - Will contain a valid token
UUID="1337-nonexistent-bberastegui"

cd fresh.py/
# Try to hide output as much as possible
python3 fresh.py -q google.com -b 8.8.8.8 -f ${UUID}-unlikely.com -v >> /dev/null

cd /
git config --global user.name "autoupdater"
git config --global user.email "autoupdater@localhost"
git clone https://${GITHUB_TOKEN}@github.com/BBerastegui/fresh-dns-servers.git
mv /fresh.py/resolvers.txt /fresh-dns-servers/resolvers.txt
cd /fresh-dns-servers/

# Create a csv format one
cat resolvers.txt | tr '\n' ',' | sed 's/,$//' >> /fresh-dns-servers/resolvers.csv

git add resolvers.*
git commit -m "$(date +%Y%m%d) update."
git push
