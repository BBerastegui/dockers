FROM golang:alpine

RUN ulimit -n 4096 && apk add git && \
        go get -d -v github.com/proabiral/inception && \
        cd $GOPATH/src/github.com/proabiral/inception && \
        git checkout beta && cd $GOPATH/bin && \
        go build -o inception ../src/github.com/proabiral/inception

ENTRYPOINT ["inception"]
