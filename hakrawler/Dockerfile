FROM golang:latest as build-env

RUN CGO_ENABLED=0 go get github.com/hakluke/hakrawler

FROM alpine:latest
COPY --from=build-env /go/bin/hakrawler /usr/bin

ENTRYPOINT ["hakrawler"]
