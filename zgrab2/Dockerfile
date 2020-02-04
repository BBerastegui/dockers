FROM golang:alpine as build

RUN apk add git make && go get github.com/zmap/zgrab2 && \
    cd $GOPATH/src/github.com/zmap/zgrab2 && make

FROM alpine

COPY --from=build /go/src/github.com/zmap/zgrab2/cmd/zgrab2/zgrab2 /usr/local/bin/zgrab2

ENTRYPOINT ["zgrab2"]
