FROM golang:alpine

RUN apk add git && go get -u -v github.com/sensepost/gowitness

# From: https://github.com/Zenika/alpine-chrome/blob/master/Dockerfile
# Installs latest Chromium package.
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community > /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    libstdc++@edge \
    chromium@edge \
    harfbuzz@edge \
    nss@edge \
    freetype@edge \
    ttf-freefont@edge \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

ENTRYPOINT ["gowitness"]
