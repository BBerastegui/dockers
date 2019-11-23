FROM golang:alpine as build

RUN apk add git && go get -u github.com/tomnomnom/unfurl && rm -rf /go/src && rm -rf /var/cache/apk/*

FROM alpine

COPY --from=build /go/bin/unfurl /usr/local/bin/unfurl

ENTRYPOINT ["unfurl"]
