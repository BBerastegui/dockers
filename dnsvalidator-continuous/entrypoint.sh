#!/bin/bash

/usr/local/bin/dnsvalidator -o /resolvers.txt \
    -tL https://public-dns.info/nameservers.txt \
    -tL https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt

# GITHUB_TOKEN - Will contain a valid token

cd /
git config --global user.name "autoupdater"
git config --global user.email "autoupdater@localhost"
git clone https://${GITHUB_TOKEN}@github.com/BBerastegui/fresh-dns-servers.git
mv /resolvers.txt /fresh-dns-servers/resolvers.txt
cd /fresh-dns-servers/

# Create a csv format one
cat resolvers.txt | tr '\n' ',' | sed 's/,$//' >> /fresh-dns-servers/resolvers.csv

git add resolvers.*
git commit -m "$(date +%Y%m%d) update."
git push
