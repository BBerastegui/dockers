#!/bin/bash

wget https://public-dns.info/nameservers.txt
wget https://raw.githubusercontent.com/blechschmidt/massdns/master/lists/resolvers.txt
cat nameservers.txt resolvers.txt | sort -u >> ns_input.txt

/usr/local/bin/dnsvalidator -o /resolvers.txt \
    -threads 60 \
    -r example.com \
    -tL ns_input.txt

# GITHUB_TOKEN - Will contain a valid token

cd /
git config --global user.name "autoupdater"
git config --global user.email "autoupdater@localhost"
git clone https://${GITHUB_TOKEN}@github.com/BBerastegui/fresh-dns-servers.git
# Remove blank line: https://github.com/BBerastegui/fresh-dns-servers/issues/2
sed -i '/^$/d' /resolvers.txt
# Move resolvers.txt to the repo
mv /resolvers.txt /fresh-dns-servers/resolvers.txt
cd /fresh-dns-servers/

# Create a csv version
cat resolvers.txt | tr '\n' ',' | sed 's/,$//' >> /fresh-dns-servers/resolvers.csv

git add resolvers.*
git commit -m "$(date +%Y%m%d) update."
git push
