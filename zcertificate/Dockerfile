FROM golang:alpine AS build

RUN apk add git curl && go get github.com/zmap/zcertificate

RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh && \
    cd /go/src/github.com/zmap/zcertificate/ && \
    dep init && dep check && cd cmd/zcertificate && go build

# This results in a single layer image
FROM alpine:latest
COPY --from=build /go/src/github.com/zmap/zcertificate/cmd/zcertificate/zcertificate /bin/zcertificate
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
# For the entrypoint and to prettify the output
RUN apk add jq && chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
