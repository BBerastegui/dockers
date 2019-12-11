FROM golang:alpine

RUN ulimit -n 4096 && apk add git && go get github.com/proabiral/inception

ENTRYPOINT ["inception"]
