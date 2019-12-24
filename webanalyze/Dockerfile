FROM golang:latest as builder
RUN CGO_ENABLED=0 go get -u github.com/rverton/webanalyze/...

FROM alpine:latest
COPY --from=builder /go/bin/webanalyze /usr/local/bin/webanalyze
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/* && update-ca-certificates \
    && webanalyze -update

ENTRYPOINT ["webanalyze"]
