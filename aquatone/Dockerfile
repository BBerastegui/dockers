FROM golang
RUN echo "deb http://deb.debian.org/debian testing main" >> /etc/apt/sources.list && \
        apt-get update && \
        apt-get -t testing install chromium -y --no-install-recommends && \
        rm -rf /var/lib/apt/lists/* && apt-get autoclean && apt-get autoremove
RUN go get -v github.com/michenriksen/aquatone
ENTRYPOINT ["aquatone"]
